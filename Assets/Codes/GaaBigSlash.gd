extends Area2D

var explosivefx = preload("res://Assets/Scenes/Attacks/Gaa/GaaExplosives.tscn")

onready var anim = $Animation

export var ENABLED = true
export (String) var DIRECTION = "Left"
export var SPEED = 12

var knockback_vector = Vector2.ZERO
var knockback = Vector2.ZERO

var max_speed = 150

var player = null
var damage = GaaStats.SCYTHE_STRENGTH * 2


func _ready():
	for amount in 6:
		var explosive = explosivefx.instance()
		get_parent().add_child(explosive)
		
		if DIRECTION == "Left":
			explosive.global_position.x = self.global_position.x + 256
			explosive.global_position.y = self.global_position.y + rand_range(64, -16)
		elif DIRECTION == "Right":
			explosive.global_position.x = self.global_position.x - 256
			explosive.global_position.y = self.global_position.y - rand_range(-64, 16)
		
		yield(get_tree().create_timer(0.1),"timeout")


func _process(_delta):
	if ENABLED:
		if DIRECTION == "Right":
			rotation_degrees = 0
			knockback_vector = Vector2.RIGHT
			position.x += SPEED
		elif DIRECTION == "Left":
			rotation_degrees = -180
			knockback_vector = Vector2.LEFT
			position.x -= SPEED


func _on_GaaBigSlash_body_entered(body):
	if body.is_in_group("Enemy"):
		if body.HP > 0:
			body.ENABLED = false
		
			body.knockback = knockback_vector * 100
			body.velocity = body.knockback
			body.HP -= damage


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Explode":
		self.queue_free()

