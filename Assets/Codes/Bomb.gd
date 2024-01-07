extends Area2D

onready var anim = $AnimationPlayer

export var ENABLED = false

var knockback_vector = Vector2.ZERO
var knockback = Vector2.ZERO

var max_speed = 150

var player = null
var damage = 5


func _ready():
	anim.play("Idle")
	
	position -= max_speed * Vector2.UP.rotated(rotation) * 5
	
	yield(get_tree().create_timer(3),"timeout")
	
	anim.play("Explode")


func _process(delta):
	if ENABLED:
		if player != null:
			knockback_vector = Vector2.RIGHT
			
			look_at(player.global_position)
			position = position.move_toward(player.global_position, max_speed * delta)
		else:
			position += max_speed * Vector2.RIGHT.rotated(rotation) * delta


func destroy():
	self.queue_free()


func _on_Bomb_body_entered(body):
	if body.is_in_group("Player"):
		if GlobalSettings.difficulty != 0:
			if body.ENABLED:
				body.ENABLED = false
			
				if not body.INVINCIBLE:
					body.knockback = knockback_vector * 100
					body.velocity = body.knockback
				
					if body.BLOCK:
						PlayerStats.HP -= damage - 2
						GaaStats.HP -= damage - 2
						SackStats.HP -= damage - 2
					else:
						if GlobalSettings.difficulty != 0:
							body.ENABLED = true
							PlayerStats.HP -= damage
							GaaStats.HP -= damage
							SackStats.HP -= damage
						if GlobalSettings.difficulty == 2:
							body.ENABLED = true
							PlayerStats.HP -= damage * 2
							GaaStats.HP -= damage * 2
							SackStats.HP -= damage * 2
					
					anim.play("Explode")
			
			if not body.ENABLED:
				body.ENABLED = true


func _on_PlayerFinder_body_entered(body):
	if body.is_in_group("Player"):
		player = body

