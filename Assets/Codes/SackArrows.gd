extends Area2D

onready var anim = $Animation

export var ENABLED = false
export (String) var DIRECTION = "Left"
export var SPEED = 2
export var MULTIPLIER = 0.2
export var KNOCKBACK = 100

var knockback_vector = Vector2.ZERO
var knockback = Vector2.ZERO

var max_speed = 150

var player = null
var damage = SackStats.STAFF_STRENGTH * MULTIPLIER


func _process(_delta):
	damage = SackStats.STAFF_STRENGTH * MULTIPLIER
	
	if ENABLED:
		if DIRECTION == "Right":
			knockback_vector = Vector2.RIGHT
			position.x += SPEED
			$Sprite.flip_h = true
			anim.play("Arrow Right")
		elif DIRECTION == "Left":
			knockback_vector = Vector2.LEFT
			position.x -= SPEED
			$Sprite.flip_h = false
			anim.play("Arrow Left")


func _on_SackArrows_body_entered(body):
	if body.is_in_group("Enemy"):
		if body.HP > 0:
			ENABLED = false
			body.ENABLED = false
			
			body.knockback = knockback_vector * KNOCKBACK
			body.velocity = body.knockback
			body.HP -= damage
			
			anim.play("Explode")


func _on_Explode_finished():
	self.queue_free()

