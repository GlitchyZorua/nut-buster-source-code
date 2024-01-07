extends Control

onready var trans = $Transition/Animation
onready var cooldown = $Cooldown
onready var sprite = $Trophies

onready var title = $Title
onready var desc = $Title/Description

export var CHOOSING = 0
export var COOLDOWN = false


func _ready():
	trans.play("TransitionOut")
	
	if Global.menu.playing:
		Global.menu.stop()


func _process(delta):
	selecting()
	trophies()
	title()
	
	sprite.frame = CHOOSING
	
	if Input.is_action_just_pressed("ui_cancel"):
		trans.play("TransitionIn")
		
		$Arrows/PointerRight.disabled = true
		$Arrows/PointerLeft.disabled = true
		$Title/Back.disabled = true


func selecting():
	if CHOOSING >= sprite.hframes:
		CHOOSING = 0
	if CHOOSING < 0:
		CHOOSING = sprite.hframes - 1
	
	if not COOLDOWN:
		if Input.is_action_just_pressed("ui_right"):
			$Choosing.play("Choosing")
			CHOOSING += 1
			
			cooldown.start()
			COOLDOWN = true
			
			$Selecting.play()
		
		elif Input.is_action_just_pressed("ui_left"):
			$Choosing.play("Choosing")
			CHOOSING -= 1
			
			cooldown.start()
			COOLDOWN = true
			
			$Selecting.play()


func title():
	if CHOOSING == 0:
		title.text = "YOU PLAYED THE GAME!!!"
		desc.text = "THANK YOU!!!"
	elif CHOOSING == 1:
		title.text = "You Found 'Them'"
		desc.text = "=)"
	elif CHOOSING == 2:
		title.text = "YOU BEAT SACK!!!"
		desc.text = "'I hate this, I hate you'"
	elif CHOOSING == 3:
		title.text = "NUTKICKER"
		desc.text = "TY for playing section 1!!"
	elif CHOOSING == 4:
		title.text = "ARE YOU DEAF?!"
		desc.text = "MY GOD IT'S SO FUCKIN LOUD AA"
	elif CHOOSING == 5:
		title.text = "Get Flashbanged"
		desc.text = "Hope ya had your sunglasses before you did this"
	elif CHOOSING == 6:
		title.text = "YOU GOT LIANA'S IP ADDRESS!!!!"
		desc.text = "'69.999.66.99'"
	elif CHOOSING == 7:
		title.text = "HAPPY BAA"
		desc.text = ":D"
	elif CHOOSING == 8:
		title.text = "HOW TF DID YOU DID THAT?!?!"
		desc.text = "That's so insane holy-"
	elif CHOOSING == 9:
		title.text = "NUT CRITIC"
		desc.text = "Man i really hope the person you kicked is doing fine lmao"
	elif CHOOSING == 10:
		title.text = "OOF"
		desc.text = "I am very sorry for your *lost* :3"


func trophies():
	if CHOOSING == 0:
		if PlayerStats.HAS_PLAYED >= 0:
			sprite.modulate = Color(1, 1, 1)
			$Title/Desc.text = ""
	
	
	if CHOOSING == 1:
		if not PlayerStats.HAS_MET_LIANA:
			sprite.modulate = Color(0, 0, 0)
			if OS.get_name() == "HTML5":
				$Title/Desc.text = "You Need To Download The PC Version For This"
			if OS.get_name() == "Windows":
				$Title/Desc.text = "You Need To Delete A Certain File"
		else:
			sprite.modulate = Color(1, 1, 1)
			$Title/Desc.text = ""
	
	
	if CHOOSING == 2:
		if not PlayerStats.BEAT_SACK:
			sprite.modulate = Color(0, 0, 0)
			$Title/Desc.text = "Beat Sack"
		else:
			sprite.modulate = Color(1, 1, 1)
			$Title/Desc.text = ""
	
	
	if CHOOSING == 3:
		if PlayerStats.BEATED_SECTIONS < 1:
			sprite.modulate = Color(0, 0, 0)
			$Title/Desc.text = "Beat section 1 of the game"
		elif PlayerStats.BEATED_SECTIONS >= 1:
			sprite.modulate = Color(1, 1, 1)
			$Title/Desc.text = ""
	
	
	if CHOOSING == 4:
		if not PlayerStats.DEAF:
			sprite.modulate = Color(0, 0, 0)
			$Title/Desc.text = "Turn the volume up to the maximum (if you dare >:))"
		else:
			sprite.modulate = Color(1, 1, 1)
			$Title/Desc.text = ""
	
	
	if CHOOSING == 5:
		if not PlayerStats.FLASHED:
			sprite.modulate = Color(0, 0, 0)
			$Title/Desc.text = "Turn the brightness up to maximum"
		else:
			sprite.modulate = Color(1, 1, 1)
			$Title/Desc.text = ""
	
	
	if CHOOSING == 6:
		if not PlayerStats.IPADDRESS:
			sprite.modulate = Color(0, 0, 0)
			$Title/Desc.text = "Get liana's ip address"
		else:
			sprite.modulate = Color(1, 1, 1)
			$Title/Desc.text = ""
	
	
	if CHOOSING == 7:
		if not PlayerStats.HAPPYBAA:
			sprite.modulate = Color(0, 0, 0)
			$Title/Desc.text = "Click on baa's face during the beginning cutscene"
		else:
			sprite.modulate = Color(1, 1, 1)
			$Title/Desc.text = ""
	
	
	if CHOOSING == 8:
		if not PlayerStats.VERYCLOSE:
			sprite.modulate = Color(0, 0, 0)
			$Title/Desc.text = "If there is a timer starting, pause at 0.10 seconds to get this achievement"
		else:
			sprite.modulate = Color(1, 1, 1)
			$Title/Desc.text = ""
	
	
	if CHOOSING == 9:
		if not PlayerStats.FIRSTCRITIKAL:
			sprite.modulate = Color(0, 0, 0)
			$Title/Desc.text = "Get your FIRST critical strike"
		else:
			sprite.modulate = Color(1, 1, 1)
			$Title/Desc.text = ""
	
	
	if CHOOSING == 10:
		if not PlayerStats.SOCLOSE:
			sprite.modulate = Color(0, 0, 0)
			$Title/Desc.text = "Die while the boss was at 25% HP"
		else:
			sprite.modulate = Color(1, 1, 1)
			$Title/Desc.text = ""


func _on_Animation_animation_finished(anim_name):
	if anim_name == "TransitionIn":
		get_tree().change_scene("res://Assets/Scenes/Menu/Menu.tscn")


func _on_Cooldown_timeout():
	cooldown.stop()
	COOLDOWN = false


func _on_Back_pressed():
	$Arrows/PointerRight.disabled = true
	$Arrows/PointerLeft.disabled = true
	$Title/Back.disabled = true
	
	trans.play("TransitionIn")
	$Selected.play()


func _on_Stuff_focus_entered():
	$Selecting.play()


func _on_Stuff_mouse_entered():
	$Selecting.play()


func _on_PointerRight_pressed():
	$Choosing.play("Choosing")
	CHOOSING += 1
	
	cooldown.start()
	COOLDOWN = true
	
	$Selecting.play()


func _on_PointerLeft_pressed():
	$Choosing.play("Choosing")
	CHOOSING -= 1
	
	cooldown.start()
	COOLDOWN = true
	
	$Selecting.play()

