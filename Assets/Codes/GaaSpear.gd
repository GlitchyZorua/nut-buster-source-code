extends Area2D

onready var anim = $Animation

export var ENABLED = false
export (String) var DIRECTION = "Left"
export var SPEED = 2

var knockback_vector = Vector2.ZERO
var knockback = Vector2.ZERO

var max_speed = 150

var player = null
var damage = GaaStats.SCYTHE_STRENGTH * 0.5


func _process(_delta):
	if ENABLED:
		if DIRECTION == "Right":
			knockback_vector = Vector2.RIGHT
			position.x += SPEED
		elif DIRECTION == "Left":
			knockback_vector = Vector2.LEFT
			position.x -= SPEED


func _on_GaaSpear_body_entered(body):
	if body.is_in_group("Enemy"):
		if body.ENABLED:
			body.ENABLED = false
		
			body.knockback = knockback_vector * 100
			body.velocity = body.knockback
			body.HP -= damage
			
			anim.play("Explode")


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Explode" or anim_name == "Spear":
		self.queue_free()

