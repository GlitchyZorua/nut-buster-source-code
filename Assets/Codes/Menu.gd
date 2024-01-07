extends Control

var alt_menu = preload("res://Assets/Music/Menu.mp3")
var real_menu = preload("res://Assets/Music/New Menu.mp3")
var newer_menu = preload("res://Assets/Music/Newer Menu.mp3")

onready var trans = $Transition/Animation
onready var anim = $Animation
onready var anim2 = $Animation2

onready var begin = $TitleBorder/Begin
onready var setting = $TitleBorder/Settings
onready var achievements = $TitleBorder/Achievements
onready var extra = $TitleBorder/Extra
onready var quit = $TitleBorder/Quit

onready var selecting = $Selecting
onready var selected = $Selected

onready var flashing = $Transition/Whiteness

var change = 0
var animationed = 0
var can_change = true


func _ready():
	PlayerStats.HP = PlayerStats.MAX_HP
	PlayerStats.LEG_BOOST = false
	PlayerStats.load_game()
	
	GlobalSettings.load_settings()
	
	animationed = floor(rand_range(0, 51))
	
	if animationed == 0:
		$Character.animation = "Default"
	elif animationed == 47:
		$Character.animation = "Burger"
	elif animationed == 50:
		$Character.animation = "Crappy"
	
	if not Global.menu.playing:
		Global.menu.play()
	
	Global.menu.pitch_scale = 1
	
	if GlobalSettings.screenshake:
		anim.play("Menu")
	else:
		anim.play("Menu Static")
		$Camera.rotating = false
	
	if GlobalSettings.flashingfx:
		if not Global.has_played:
			anim2.play("Flash")
			Global.has_played = true
		else:
			anim2.queue_free()
			flashing.queue_free()
	else:
		anim2.queue_free()
		flashing.queue_free()
	
	PlayerStats.secret()
	
	Global.mainmusic.stop()
	
	Global.extra = false
	
	if Global.has_played:
		trans.play("TransitionOut")
	else:
		trans.play("StaticTransitionOut")
	
	begin.grab_focus()


func _process(_delta):
	PlayerStats.HP = PlayerStats.MAX_HP
	
	if can_change:
		if not Global.menu.playing:
			Global.menu.play()
	
		if Input.is_action_just_pressed("ui_change_menu_song_1"):
			Global.menu.stream = alt_menu
			Global.menu.play()
		
		if Input.is_action_just_pressed("ui_change_menu_song_2"):
			Global.menu.stream = real_menu
			Global.menu.play()
		
		if Input.is_action_just_pressed("ui_change_menu_song_3"):
			Global.menu.stream = newer_menu
			Global.menu.play()
	
	if Input.is_action_just_pressed("ui_secret_code_room"):
		Global.menu.stop()
		
		if can_change:
			change = 99
			disable_all_buttons()
			trans.play("TransitionIn")
			
			can_change = false
			
			selected.play()
	
	Global.mainmusic.stop()


func _on_Begin_pressed():
	if can_change:
		change = 0
		disable_all_buttons()
		trans.play("TransitionIn")
		
		if GlobalSettings.screenshake:
			anim.play("TransitionIn")
		
		can_change = false
		
		selected.play()


func _on_Settings_pressed():
	if can_change:
		change = 1
		disable_all_buttons()
		trans.play("TransitionIn")
		
		if GlobalSettings.screenshake:
			anim.play("TransitionIn")
		
		can_change = false
		
		selected.play()


func _on_Achievements_pressed():
	if can_change:
		change = 4
		disable_all_buttons()
		trans.play("TransitionIn")
		
		if GlobalSettings.screenshake:
			anim.play("TransitionIn")
		
		can_change = false
		
		selected.play()


func _on_Quit_pressed():
	if can_change:
		change = 2
		disable_all_buttons()
		trans.play("TransitionIn")
		
		if GlobalSettings.screenshake:
			anim.play("TransitionIn")
		
		can_change = false
		
		selected.play()


func _on_Extra_pressed():
	if can_change:
		change = 3
		disable_all_buttons()
		trans.play("TransitionIn")
		
		if GlobalSettings.screenshake:
			anim.play("TransitionIn")
		
		can_change = false
		
		selected.play()


func _on_Animation_animation_finished(anim_name):
	if anim_name == "TransitionIn":
		if change == 0:
			get_tree().change_scene("res://Assets/Scenes/Menu/CharacterSelection.tscn")
		if change == 1:
			get_tree().change_scene("res://Assets/Scenes/Menu/Settings.tscn")
		if change == 2:
			get_tree().quit()
		if change == 3:
			get_tree().change_scene("res://Assets/Scenes/Menu/ExtraSelection.tscn")
		if change == 4:
			get_tree().change_scene("res://Assets/Scenes/Menu/Achievements.tscn")
		if change == 99:
			get_tree().change_scene("res://Assets/Scenes/Menu/SecretCodeRoom.tscn")


func _on_Stuff_focus_entered():
	if can_change:
		selecting.play()


func _on_Stuff_mouse_entered():
	if can_change:
		selecting.play()


func disable_all_buttons():
	begin.disabled = true
	setting.disabled = true
	achievements.disabled = true
	extra.disabled = true
	quit.disabled = true

