extends KinematicBody2D

var kilroslash = preload("res://Assets/Scenes/Attacks/Kilro/KilroSlash.tscn")
var kilro4hands = preload("res://Assets/Scenes/Attacks/Kilro/Kilro4Hands.tscn")
var kilrobighand = preload("res://Assets/Scenes/Attacks/BigSpidaBoss/BigSpidaHand.tscn")
var twistingblast = preload("res://Assets/Scenes/Attacks/Kilro/TwistingBlast.tscn")
var kilrosackattac = preload("res://Assets/Scenes/Attacks/Kilro/KilroSackAttac.tscn")

onready var timer = $Timer
onready var timerbar  = $TimerLayer/TimerBar
onready var timertitle = $TimerLayer/TimerBar/Title

onready var attackanimation = $Animation

export var enabled = false
var player = null


func _ready():
	timerbar.value = $BGMusic.get_playback_position()
	timerbar.max_value = $BGMusic.stream.get_length()


func _process(delta):
	$BGMusic.pitch_scale = Engine.time_scale
	
	timerbar.value = $BGMusic.get_playback_position()
	timerbar.max_value = $BGMusic.stream.get_length()
	
	if timerbar.value == 72:
		attackanimation.play("Full On Attacks Sack")
	elif timerbar.value == 108:
		attackanimation.play("Full On Attacks Gaa")
	if timerbar.value == 140.3:
		attackanimation.play("Reunion")
	
	timertitle.text = str("!!! SURVIVE !!! | TIME LEFT: ", timerbar.value, " / ", timerbar.max_value)


func kilro_slash():
	var newslash = kilroslash.instance()
	get_parent().add_child(newslash)
	
	newslash.global_position = player.global_position


func kilro_sack_attac():
	var arrowleft = kilrosackattac.instance()
	get_parent().add_child(arrowleft)
	
	arrowleft.global_position = Vector2(rand_range(32, 560), rand_range(128, 256))


func big_kilro_slash():
	var newslash = kilroslash.instance()
	get_parent().add_child(newslash)
	
	newslash.SHAKE = true
	newslash.global_position = player.global_position
	newslash.scale = Vector2(2, 2)


func kilro_4_hand():
	var hands = kilro4hands.instance()
	get_parent().add_child(hands)
	
	hands.global_position = player.global_position


func kilro_big_hand():
	var fist = kilrobighand.instance()
	get_parent().add_child(fist)
	
	fist.global_position = player.global_position
	fist.spr.texture = preload("res://Assets/Sprites/Misc/KilroBigHand.png")
	fist.spr.hframes = 1


func twisting_blast():
	var twisted_blaster = twistingblast.instance()
	get_parent().add_child(twisted_blaster)
	
	twisted_blaster.global_position = self.global_position


func heal():
	PlayerStats.HP = PlayerStats.MAX_HP


func timer_start():
	timerbar.show()
	
	attackanimation.play("Full On Attacks")


func timer_stop():
	timer.stop()
	timerbar.show()


func _on_Playerfinder_body_entered(body):
	if body.is_in_group("Player"):
		player = body

