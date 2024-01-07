extends Area2D

onready var anim = $Animation
onready var spr = $Sprite

export var UP = Vector2(0, -1)
export var ACCELERATION = 10
export var SPEED = 1
export var DAMAGE = 15
export var ENABLED = true

var knockback = Vector2.ZERO
var player = null


func _ready():
	anim.play("Falling")


func _process(delta):
	dash_towards_point()


func dash_towards_point():
	global_position.y += SPEED * ACCELERATION


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Falling":
		self.queue_free()


func _on_PlayerFinder_body_entered(body):
	if body.is_in_group("Player"):
		player = body


func _on_OmniDirectionalSlash_body_entered(body):
	if body.is_in_group("Player"):
		if not player.PARRY and not player.BLOCK and not player.INVINCIBLE:
			player.knockback = Vector2.DOWN * 120
			player.velocity = player.knockback
			
			if GlobalSettings.difficulty != 0:
				player.ENABLED = true
				PlayerStats.HP -= DAMAGE
				GaaStats.HP -= DAMAGE
				SackStats.HP -= DAMAGE
			if GlobalSettings.difficulty == 2:
				player.ENABLED = true
				PlayerStats.HP -= DAMAGE * 2
				GaaStats.HP -= DAMAGE * 2
				SackStats.HP -= DAMAGE * 2
		
		if player.BLOCK and not player.PARRY and player.ENABLED:
			player.knockback = Vector2.DOWN * 50
			player.velocity = player.knockback
			
			if GlobalSettings.difficulty != 0:
				PlayerStats.HP -= 1

