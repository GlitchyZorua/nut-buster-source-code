extends KinematicBody2D

var impact = preload("res://Assets/Scenes/Misc/Impact.tscn")
var cloudfx = preload("res://Assets/Scenes/Misc/DashClouds.tscn")

onready var anim = $Animation
onready var spr = $Sprite

export var UP = Vector2(0, -1)
export var DAMAGE = 25
export var ENABLED = false

var velocity = Vector2()
var knockback = Vector2.ZERO

var player = null


func _ready():
	anim.play("Falling")


func _process(delta):
	knockbacked(delta)


func knockbacked(fps):
	knockback = knockback.move_toward(Vector2.ZERO, 100 * fps)
	knockback = move_and_slide(knockback)


func cloud():
	var clouds = cloudfx.instance()
	get_parent().add_child(clouds)
	
	clouds.get_node("Sprite").queue_free()
	
	clouds.global_position = self.global_position
	
	clouds.emitting = true
	clouds.one_shot = true
	clouds.modulate = self.modulate


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
				
				self.queue_free()
				cloud()
			if GlobalSettings.difficulty == 2:
				player.ENABLED = true
				PlayerStats.HP -= DAMAGE * 2
				GaaStats.HP -= DAMAGE * 2
				SackStats.HP -= DAMAGE * 2
				
				self.queue_free()
				cloud()
		
		if player.BLOCK and not player.PARRY and player.ENABLED:
			player.knockback = Vector2.DOWN * -50
			player.velocity = player.knockback
			
			if GlobalSettings.difficulty != 0:
				PlayerStats.HP -= 2
				
				self.queue_free()
				cloud()


func _on_HurtArea_area_entered(area):
	if area.is_in_group("Player") and ENABLED:
		var impactframe = impact.instance()
		get_parent().get_parent().add_child(impactframe)
		
		impactframe.global_position.x = self.global_position.x
		impactframe.global_position.y = self.global_position.y
		
		impactframe.modulate = self.modulate
		
		var clouds = cloudfx.instance()
		get_parent().add_child(clouds)
		
		clouds.get_node("Sprite").queue_free()
		
		clouds.global_position = self.global_position
		
		clouds.emitting = true
		clouds.one_shot = true
		clouds.modulate = self.modulate


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Falling":
		self.queue_free()
		cloud()

