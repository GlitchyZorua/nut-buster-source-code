extends Area2D

onready var anim = $Animation

export var UP = Vector2(0, -1)
export var DAMAGE = 5
export var ENABLED = true
export var SHAKE = false

var knockback = Vector2.ZERO


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Spin":
		self.queue_free()


func _on_TwistingBlast_body_entered(body):
	if body.is_in_group("Player"):
		if not body.PARRY and not body.BLOCK and not body.INVINCIBLE:
			body.knockback = Vector2.DOWN * 120
			body.velocity = body.knockback
			
			if GlobalSettings.difficulty != 0:
				body.ENABLED = true
				PlayerStats.HP -= DAMAGE
		
		if body.BLOCK and not body.PARRY and body.ENABLED:
			body.knockback = Vector2.DOWN * 50
			body.velocity = body.knockback
			
			if GlobalSettings.difficulty != 0:
				PlayerStats.HP -= 2

