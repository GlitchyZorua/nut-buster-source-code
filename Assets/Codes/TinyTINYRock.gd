extends Area2D

var parryshield = preload("res://Assets/Scenes/Misc/ParryShield.tscn")

var knockback_vector = Vector2.ZERO
var knockback = Vector2.ZERO

onready var spr = $Sprite

export var SPEED = 2
export var ENABLED = true
export (String) var DIRECTION = "Left"
export var DAMAGE = 1


func _ready():
	pass


func _process(_delta):
	if DIRECTION == "Right":
		spr.rotation_degrees += 10
	elif DIRECTION == "Left":
		spr.rotation_degrees -= 10
	
	if ENABLED == true:
		if DIRECTION == "Right":
			knockback_vector = Vector2.RIGHT
			position.x += SPEED
		elif DIRECTION == "Left":
			knockback_vector = Vector2.LEFT
			position.x -= SPEED


func _on_Object_body_entered(body):
	if body.is_in_group("Player"):
		if body.PARRY:
			var shield = parryshield.instance()
			get_parent().add_child(shield)
			
			if MidDialogue.tutorialpoints == 5:
				MidDialogue.dialogue_index = 37
				MidDialogue.tutorial(6)
			
			shield.global_position = self.global_position
			
			if DIRECTION == "Left":
				SPEED = 6
				DIRECTION = "Right"
			elif DIRECTION == "Right":
				SPEED = 6
				DIRECTION = "Left"
		
		if not body.PARRY:
			if GlobalSettings.difficulty != 0:
				if not body.INVINCIBLE:
					body.knockback = knockback_vector * 100
					body.velocity = body.knockback
					
					body.ENABLED = true
					
					self.queue_free()
					
					if body.BLOCK:
						PlayerStats.HP -= 1
						GaaStats.HP -= 1
						SackStats.HP -= 1
					else:
						PlayerStats.HP -= DAMAGE
						GaaStats.HP -= DAMAGE
						SackStats.HP -= DAMAGE


func _on_Timer_timeout():
	self.queue_free()

