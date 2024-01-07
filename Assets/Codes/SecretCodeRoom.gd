extends Control

var text = Dialogue.cutscene_dialogue_1

onready var trans = $VHSLayer/VHS/Transition
onready var secretline = $SecretLine

onready var anim = $VHSLayer/Sprite/Animation
onready var dialogsprite = $VHSLayer/Sprite
onready var dialogname = $VHSLayer/Sprite/Name
onready var dialogtext = $VHSLayer/Sprite/Text
onready var timer = $VHSLayer/Sprite/Timer

onready var textvc = $TextVC
onready var vhsinsertion = $InsertVHS

var dialogue_index = 0
var finished
var active 

var expression = 0
var trigger = ""


func _ready():
	secretline.grab_focus()
	trans.play("TransitionOut")


func _process(_delta):
	dialogue_input()
	cutscene_trigger()
	
	if not finished:
		dialogsprite.frame = expression


func dialogue_input():
	if dialogtext.visible_characters >= dialogtext.get_total_character_count():
		if trigger == "Skip" and finished == true:
			load_dialogue()
	
	if Input.is_action_just_pressed("ui_accept"):
		if finished == true and dialogtext.text != "":
			load_dialogue()
		
		if secretline.visible:
			if secretline.text == "Truce":
				secretline.hide()
				secretline.text = ""
				secretline.editable = false
				anim.play("Lore 1")
				vhsinsertion.play()
				
				text = Dialogue.lore_dialogue_1
	
	if Input.is_action_just_pressed("ui_block") and dialogtext != null:
		dialogtext.visible_characters = 9999
		finished = true
	
	if Input.is_action_pressed("ui_skip") and dialogtext.text != "":
		load_dialogue()
	
	if Input.is_action_just_pressed("ui_cancel"):
		trans.play("TransitionIn")


func cutscene_trigger():
	if trigger == "Lore_Cutscene_1":
		anim.play("Lore_Cutscene_1")


func _on_Animation_animation_finished(anim_name):
	if anim_name == "TransitionIn":
		get_tree().change_scene("res://Assets/Scenes/Menu/Menu.tscn")


func _on_SecretLine_text_changed(new_text):
	$TyperSFX.play()


func load_dialogue():
	if trigger == "End":
		trans.play("TransitionIn")
	
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
	else:
		dialogtext.visible_characters += 1
		textvc.play()

