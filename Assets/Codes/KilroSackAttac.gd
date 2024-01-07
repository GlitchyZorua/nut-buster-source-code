extends Area2D

onready var anim = $Animation

export var ENABLED = false
export var MULTIPLIER = 0.2
export var KNOCKBACK = 100

var knockback_vector = Vector2.ZERO
var knockback = Vector2.ZERO

var player = null
var damage = 25


func _process(_delta):
	knockback_vector = Vector2.DOWN


func _on_KilroSackAttac_body_entered(body):
	if body.is_in_group("Player"):
		if not body.PARRY and not body.BLOCK and not body.INVINCIBLE:
			body.knockback = Vector2.DOWN * KNOCKBACK
			body.velocity = body.knockback
			
			if GlobalSettings.difficulty != 0:
				body.ENABLED = true
				PlayerStats.HP -= damage
		
		if body.BLOCK and not body.PARRY and body.ENABLED:
			body.knockback = Vector2.DOWN * 50
			body.velocity = body.knockback
			
			if GlobalSettings.difficulty != 0:
				PlayerStats.HP -= 2


func _on_Explode_finished():
	self.queue_free()

