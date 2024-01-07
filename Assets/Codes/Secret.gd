extends Control

var text = Dialogue.secret_dialogue

onready var background = $Background
onready var dialogsprite = $Sprite
onready var dialogname = $Name
onready var dialogtext = $Text
onready var timer = $Timer

onready var textvc = $TextVC
onready var evilvc = $EvilVC

onready var bgmusic = $BGMusic

var dialogue_index = 0
var finished
var active 

var expression = 0
var trigger = ""


func _ready():
	OS.window_borderless = true
	OS.window_fullscreen = true
	
	PlayerStats.HAS_MET_LIANA = true
	PlayerStats.save_game()
	PlayerStats.secret()
	
	if not PlayerStats.HAS_MET_LIANA:
		Global.emit_signal("ACHIEVEMENT")
		Global.achieveddesc.text = "=)"
		Global.achievedtitle.text = "------------------"
		Global.achievedsprite.frame = 1
	
	dialogsprite.show()


func _process(_delta):
	OS.window_fullscreen = true
	
	if expression == 1:
		dialogsprite.frame = 2
		bgmusic.stop()
	
	if trigger == "Quit":
		$AnimationPlayer.play("Laugh")
	
	if Input.is_action_just_pressed("ui_accept"):
		if finished:
			load_dialogue()


func quit():
	get_tree().quit()


func load_dialogue():
	if dialogue_index < text.size():
		active = true
		finished = false
		
		dialogname.text = text[dialogue_index]["Name"]
		dialogtext.bbcode_text = text[dialogue_index]["Text"]
		expression = text[dialogue_index].Expressions
		trigger = text[dialogue_index]["Trigger"]
		
		timer.wait_time = text[dialogue_index].Speed
		
		dialogtext.percent_visible = 0
		timer.start()
	else:
		finished = true
		active = false
	dialogue_index += 1


func _on_Timer_timeout():
	if dialogtext.visible_characters >= dialogtext.get_total_character_count():
		timer.stop()
		finished = true
		
		dialogsprite.frame = 0
	else:
		if expression != 1:
			if dialogtext.text != ". . .":
				dialogsprite.frame = 1
				textvc.pitch_scale = 0.2
				textvc.play()
		
		if expression == 1:
			evilvc.play()
		
		dialogtext.visible_characters += 1


func _on_Laugh_finished():
	quit()

