extends KinematicBody2D

var impact = preload("res://Assets/Scenes/Misc/Impact.tscn")
var cloudfx = preload("res://Assets/Scenes/Misc/DashClouds.tscn")

onready var anim = $Animation
onready var spr = $Sprite

export var UP = Vector2(0, -1)
export var DAMAGE = 15
export var ENABLED = false

var velocity = Vector2()
var knockback = Vector2.ZERO

var player = null


func _ready():
	anim.play("Falling")
	
	yield(get_tree().create_timer(2.5),"timeout")
	
	self.queue_free()


func _process(delta):
	knockbacked(delta)


func knockbacked(fps):
	knockback = knockback.move_toward(Vector2.ZERO, 100 * fps)
	knockback = move_and_slide(knockback)


func _on_PlayerFinder_body_entered(body):
	if body.is_in_group("Player"):
		player = body


func _on_DamageArea_body_entered(body):
	if body.is_in_group("Player"):
		if not player.PARRY and not player.BLOCK and not player.INVINCIBLE:
			player.knockback = Vector2.DOWN * -120
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
				
				self.queue_free()
		
		if player.BLOCK and not player.PARRY and player.ENABLED:
			player.knockback = Vector2.DOWN * -50
			player.velocity = player.knockback
			
			if GlobalSettings.difficulty != 0:
				PlayerStats.HP -= 2
				GaaStats.HP -= 2
				SackStats.HP -= 2
				
				self.queue_free()

