extends KinematicBody2D

var impact = preload("res://Assets/Scenes/Misc/Impact.tscn")
var cloudfx = preload("res://Assets/Scenes/Misc/DashClouds.tscn")

var knockback = Vector2.ZERO

export var ENABLED = true
export var PARRY = false

export var HP = 0

onready var spr = $Sprite

var player_hitted = false


func _process(delta):
	knockbacked(delta)


func knockbacked(fps):
	knockback = knockback.move_toward(Vector2.ZERO, 100 * fps)
	knockback = move_and_slide(knockback)


func _on_HurtArea_area_entered(area):
	if area.is_in_group("Player"):
		$Hurt.play()
		$Sprite.animation = "Kicked"
		
		var impactframe = impact.instance()
		get_parent().get_parent().add_child(impactframe)
		
		impactframe.global_position.x = self.global_position.x
		impactframe.global_position.y = self.global_position.y
		
		impactframe.modulate = self.modulate
		
		player_hitted = true


func _on_Sprite_animation_finished():
	if $Sprite.animation == "Kicked":
		$Sprite.animation = "Idle"
		
		player_hitted = false


func _on_DamageArea_body_entered(body):
	if body.is_in_group("Enemy"):
		if player_hitted:
			self.queue_free()
			
			var clouds = cloudfx.instance()
			get_parent().add_child(clouds)
			
			clouds.get_node("Sprite").queue_free()
			
			clouds.global_position = self.global_position
			
			clouds.emitting = true
			clouds.one_shot = true
			clouds.modulate = self.modulate
			
			body.HP -= 10 * PlayerStats.LEG_LEVEL

