extends Area2D


onready var anim = $Animation

export var UP = Vector2(0, -1)
export var DAMAGE = 5
export var ENABLED = true
export var SHAKE = false

var knockback = Vector2.ZERO


func shake():
	if SHAKE:
		Global.camera.shake(90, 0.2)


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Explode":
		self.queue_free()


func _on_ExplodingKnives_body_entered(body):
	if body.is_in_group("Enemy"):
		if body.HP > 0:
			body.knockback = Vector2.LEFT * 120
			body.velocity = body.knockback
			
			body.HP -= GaaStats.SCYTHE_STRENGTH * 1

