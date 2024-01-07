extends KinematicBody2D

export var SPEED = 250
export var DAMAGE = 5

var velocity = Vector2()

var knockback_vector = Vector2.ZERO
var knockback = Vector2.ZERO

onready var spr = $Sprite


func _ready():
	rotation_degrees = floor(rand_range(75, -75))
	
	if rotation > 0:
		spr.flip_h = false
	if rotation < 0:
		spr.flip_h = true


func _process(delta):
	velocity += SPEED * Vector2.DOWN.rotated(rotation) * delta
	velocity = move_and_slide(velocity)


func _on_DamageArea_body_entered(body):
	if body.is_in_group("Player"):
		if not body.PARRY and not body.BLOCK and not body.INVINCIBLE:
			body.knockback = Vector2.DOWN * 120
			body.velocity = body.knockback
			
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
		
		if body.BLOCK and not body.PARRY and body.ENABLED:
			body.knockback = Vector2.DOWN * 50
			body.velocity = body.knockback
			
			if GlobalSettings.difficulty != 0:
				PlayerStats.HP -= 5


func _on_Timer_timeout():
	self.queue_free()
