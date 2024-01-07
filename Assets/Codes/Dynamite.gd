extends Area2D

var parryshield = preload("res://Assets/Scenes/Misc/ParryShield.tscn")

var knockback_vector = Vector2.ZERO
var knockback = Vector2.ZERO

onready var spr = $Sprite

export var SPEED = 2
export var ENABLED = true
export (String) var DIRECTION = "Left"
export var DAMAGE = 5


func _process(_delta):
	if spr.frame < 23:
		if DIRECTION == "Right":
			spr.rotation_degrees += 10
		elif DIRECTION == "Left":
			spr.rotation_degrees -= 10
	else:
		spr.rotation_degrees = 0
	
	if ENABLED == true:
		if DIRECTION == "Right":
			knockback_vector = Vector2.RIGHT
			position.x += SPEED
		elif DIRECTION == "Left":
			knockback_vector = Vector2.LEFT
			position.x -= SPEED


func _on_Dynamite_body_entered(body):
	if body.is_in_group("Enemy"):
		if not body.PARRY:
			$Animation.play("Exploded")
			
			body.knockback = knockback * 100
			body.velocity = body.knockback
			
			body.HP -= DAMAGE
		
		if body.PARRY:
			var shield = parryshield.instance()
			get_parent().add_child(shield)
			
			shield.global_position = self.global_position
	
			if DIRECTION == "Left":
				SPEED = 6
				DIRECTION = "Right"
			elif DIRECTION == "Right":
				SPEED = 6
				DIRECTION = "Left"
	
	if body.is_in_group("Player"):
		if body.PARRY:
			var shield = parryshield.instance()
			get_parent().add_child(shield)
	
			shield.global_position = self.global_position
			
			if DIRECTION == "Left":
				SPEED = 6
				DIRECTION = "Right"
			elif DIRECTION == "Right":
				SPEED = 6
				DIRECTION = "Left"
		
		if not body.PARRY:
			$Animation.play("Exploded")
			
			if GlobalSettings.difficulty != 0:
				if not body.INVINCIBLE:
					body.knockback = knockback_vector * 100
					body.velocity = body.knockback
					
					body.ENABLED = true
					
					if body.BLOCK:
						PlayerStats.HP -= 1
						GaaStats.HP -= 1
						SackStats.HP -= 1
					else:
						if GlobalSettings.difficulty != 0:
							body.ENABLED = true
							PlayerStats.HP -= DAMAGE
							GaaStats.HP -= DAMAGE
							SackStats.HP -= DAMAGE
						if GlobalSettings.difficulty == 2:
							body.ENABLED = true
							PlayerStats.HP -= DAMAGE * 2
							GaaStats.HP -= DAMAGE * 2
							SackStats.HP -= DAMAGE * 2


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Explosion" or anim_name == "Exploded":
		self.queue_free()

