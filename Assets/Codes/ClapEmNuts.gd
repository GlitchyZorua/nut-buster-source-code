extends Area2D

onready var anim = $Animation

export var ENABLED = false

var knockback_vector = Vector2.ZERO
var knockback = Vector2.ZERO

var player = null
var damage = PlayerStats.LEG_STRENGTH


func _on_ClapEmNuts_body_entered(body):
	if body.is_in_group("Enemy"):
		if body.HP > 0:
			body.ENABLED = false
			
			body.knockback = knockback_vector * 100
			body.velocity = body.knockback
			body.HP -= damage


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Explosion":
		self.queue_free()

