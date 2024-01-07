extends KinematicBody2D

var cloudfx = preload("res://Assets/Scenes/Misc/DashClouds.tscn")

onready var anim = $Animation
onready var spr = $Sprite

export var UP = Vector2(0, -1)
export var DAMAGE = 10
export var ENABLED = false

export var ACCELERATION = 10000
export var SPEED = 80

var velocity = Vector2()
var knockback = Vector2.ZERO

var player = null


func _process(delta):
	knockbacked(delta)
	
	if ENABLED and player != null:
		accelerate_toward_point(player.global_position, delta)


func accelerate_toward_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity.x = max(direction.x-ACCELERATION, SPEED * direction.x)
	velocity.y = min(direction.y+ACCELERATION, SPEED * direction.y)
	
	velocity = move_and_slide(velocity, UP)


func knockbacked(fps):
	knockback = knockback.move_toward(Vector2.ZERO, 100 * fps)
	knockback = move_and_slide(knockback)


func _shake():
	Global.camera.shake(120, 0.5)


func _on_PlayerFinder_body_entered(body):
	if body.is_in_group("Player"):
		player = body


func _on_DamageArea_body_entered(body):
	if body.is_in_group("Player"):
		if not player.PARRY and not player.BLOCK and not player.INVINCIBLE:
			player.knockback = Vector2.DOWN * 220
			player.velocity = player.knockback
			
			if GlobalSettings.difficulty != 0:
				player.ENABLED = true
				PlayerStats.HP -= DAMAGE
				GaaStats.HP -= DAMAGE
				SackStats.HP -= DAMAGE
			if GlobalSettings.difficulty == 2:
				player.ENABLED = true
				PlayerStats.HP -= DAMAGE * 2
				GaaStats.HP -= DAMAGE * 2
				SackStats.HP -= DAMAGE * 2
		
		if player.BLOCK and not player.PARRY and player.ENABLED:
			player.knockback = Vector2.DOWN * 50
			player.velocity = player.knockback
			
			if GlobalSettings.difficulty != 0:
				PlayerStats.HP -= 5


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Smashing":
		self.queue_free()
