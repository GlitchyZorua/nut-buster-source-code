extends CanvasLayer

var text = Dialogue.dialogue_1

var gaa = preload("res://Assets/Sprites/Dialogue Icon/GaaDialogueIcon.png")
var baa = preload("res://Assets/Sprites/Dialogue Icon/BaaDialogueIcon.png")
var sack = preload("res://Assets/Sprites/Dialogue Icon/SackDialogueIcon.png")
var liana = preload("res://Assets/Sprites/Dialogue Icon/LianaDialogueIcon.png")
var jika = preload("res://Assets/Sprites/Dialogue Icon/JikaDialogueIcon.png")
var rabi = preload("res://Assets/Sprites/Dialogue Icon/RabiDialogueIcon.png")
var debt = preload("res://Assets/Sprites/Dialogue Icon/DebtDialogueIcon.png")
var zakaria = preload("res://Assets/Sprites/Dialogue Icon/ZackariaDialogueIcon.png")
var janktopkai = preload("res://Assets/Sprites/Dialogue Icon/JankTopKaiDialogueIcon.png")
var hiya = preload("res://Assets/Sprites/Dialogue Icon/HiyaDialogueIcon.png")
var jackaron = preload("res://Assets/Sprites/Dialogue Icon/JackeronDialogueIcon.png")

onready var dialogbox = $DialogueBox
onready var dialogsprite = $DialogueBox/Sprite
onready var dialogname = $DialogueBox/Name
onready var dialogtext = $DialogueBox/Text
onready var dialogtimer = $DialogueBox/Timer
onready var leftpos = $DialogueBox/Left
onready var rightpos = $DialogueBox/Right
onready var textvc = $TextVC
onready var selecting = $Selecting
onready var selected = $Selected

onready var choices = $DialogueBox/Choices
onready var choice1 = $DialogueBox/Choices/Choice1
onready var choice2 = $DialogueBox/Choices/Choice2
onready var choice3 = $DialogueBox/Choices/Choice3
onready var choice4 = $DialogueBox/Choices/Choice4

onready var q = $DialogueBox/Q

var dialogue_index = 0
var finished
var active 

var expression = 0
var trigger = ""

var tutorialpoints = 0


func _ready():
	dialogbox.visible = false


func _process(_delta):
	potraits()
	mobile_buttons()
	inputs()
	choice()


func triggers():
	if finished:
		if trigger == "TutorialEnd":
			Global.emit_signal("TUTORIAL_END")


func inputs():
	if dialogtext.visible_characters >= dialogtext.get_total_character_count():
		if trigger == "Skip" and finished == true:
			load_dialogue()
	
	if Input.is_action_just_pressed("ui_accept") and dialogtext.text != "":
		if finished == true and not choices.visible:
			load_dialogue()
	
	if Input.is_action_just_pressed("ui_block") and dialogtext != null and not trigger == "Skip":
		dialogtext.visible_characters = 9999
		finished = true
	
	if Input.is_action_pressed("ui_skip") and dialogtext.text != "" and not choices.visible:
		load_dialogue()


func choice():
	if choice1.text == "":
		choice1.hide()
	if choice2.text == "":
		choice2.hide()
	if choice3.text == "":
		choice4.hide()
	if choice4.text == "":
		choice4.hide()
	
	if choice1.text != "":
		choice1.show()
	if choice2.text != "":
		choice2.show()
	if choice3.text != "":
		choice4.show()
	if choice4.text != "":
		choice4.show()
	
	if trigger == "BaaChoice1":
		choices.show()
		choice1.text = "Help"
		choice2.text = "Nah, let their pathetic asses be"
		choice3.text = ""
		choice4.text = ""
	else:
		choices.hide()
		choice1.text = ""
		choice2.text = ""
		choice3.text = ""
		choice4.text = ""


func tutorial(points):
	tutorialpoints = points
	load_dialogue()


func minigames():
	if trigger == "Minigame1":
		get_tree().change_scene("res://Assets/Scenes/Sections/MiniGameSection1.tscn")


func potraits():
	if dialogtext.text == "" and not choices.visible:
		dialogbox.visible = false
	else:
		dialogbox.visible = true
	
	if dialogname.text == "Gaa":
		if not Global.gaa:
			dialogsprite.texture = gaa
			dialogsprite.visible = true
			dialogsprite.frame = expression
			dialogsprite.position.x = rightpos.position.x
			dialogtext.rect_position.x = -224
			dialogsprite.offset.x = 0
			dialogsprite.offset.y = -64
			dialogsprite.flip_h = false
			dialogsprite.hframes = 21
			dialogsprite.vframes = 1
			dialogbox.frame = 0
		else:
			dialogsprite.texture = gaa
			dialogsprite.visible = true
			dialogsprite.frame = expression
			dialogsprite.position.x = leftpos.position.x
			dialogtext.rect_position.x = -128
			dialogsprite.offset.x = 0
			dialogsprite.offset.y = -64
			dialogsprite.flip_h = true
			dialogsprite.hframes = 21
			dialogsprite.vframes = 1
			dialogbox.frame = 1
	
	elif dialogname.text == "Baa":
		if Global.baa:
			dialogsprite.texture = baa
			dialogsprite.visible = true
			dialogsprite.frame = expression
			dialogsprite.position.x = leftpos.position.x
			dialogtext.rect_position.x = -128
			dialogsprite.offset.x = 0
			dialogsprite.offset.y = -64
			dialogsprite.flip_h = true
			dialogsprite.scale = Vector2(1.2, 1.2)
			dialogsprite.hframes = 27
			dialogsprite.vframes = 2
			dialogbox.frame = 1
		else:
			dialogsprite.texture = baa
			dialogsprite.visible = true
			dialogsprite.frame = expression
			dialogsprite.position.x = rightpos.position.x
			dialogtext.rect_position.x = -224
			dialogsprite.offset.x = 0
			dialogsprite.offset.y = -64
			dialogsprite.flip_h = false
			dialogsprite.scale = Vector2(1.2, 1.2)
			dialogsprite.hframes = 27
			dialogsprite.vframes = 1
			dialogbox.frame = 0
	
	elif dialogname.text == "Sack":
		if not Global.sack:
			dialogsprite.texture = sack
			dialogsprite.visible = true
			dialogsprite.frame = expression
			dialogsprite.position.x = rightpos.position.x
			dialogtext.rect_position.x = -224
			dialogsprite.offset.x = 0
			dialogsprite.offset.y = -64
			dialogsprite.flip_h = false
			dialogsprite.scale = Vector2(1.2, 1.2)
			dialogsprite.hframes = 8
			dialogsprite.vframes = 3
			dialogbox.frame = 0
		else:
			dialogsprite.texture = sack
			dialogsprite.visible = true
			dialogsprite.frame = expression
			dialogsprite.position.x = leftpos.position.x
			dialogtext.rect_position.x = -128
			dialogsprite.offset.x = 0
			dialogsprite.offset.y = -64
			dialogsprite.flip_h = true
			dialogsprite.scale = Vector2(1.2, 1.2)
			dialogsprite.hframes = 8
			dialogsprite.vframes = 3
			dialogbox.frame = 1
	
	elif dialogname.text == "Liana":
		dialogsprite.texture = liana
		dialogsprite.visible = true
		dialogsprite.frame = expression
		dialogsprite.position.x = rightpos.position.x
		dialogtext.rect_position.x = -224
		dialogsprite.offset.x = 0
		dialogsprite.offset.y = -88
		dialogsprite.flip_h = false
		dialogsprite.scale = Vector2(1.2, 1.2)
		dialogsprite.hframes = 15
		dialogsprite.vframes = 1
		dialogbox.frame = 0
	
	elif dialogname.text == "Jika":
		dialogsprite.texture = jika
		dialogsprite.visible = true
		dialogsprite.frame = expression
		dialogsprite.position.x = rightpos.position.x
		dialogtext.rect_position.x = -224
		dialogsprite.offset.x = 0
		dialogsprite.offset.y = -96
		dialogsprite.flip_h = false
		dialogsprite.scale = Vector2(1.2, 1.2)
		dialogsprite.hframes = 20
		dialogsprite.vframes = 1
		dialogbox.frame = 0
	
	elif dialogname.text == "Rabi":
		dialogsprite.texture = rabi
		dialogsprite.visible = true
		dialogsprite.frame = expression
		dialogsprite.position.x = rightpos.position.x
		dialogtext.rect_position.x = -224
		dialogsprite.offset.y = -64
		dialogsprite.flip_h = false
		dialogsprite.scale = Vector2(1.2, 1.2)
		dialogsprite.hframes = 17
		dialogsprite.vframes = 1
		dialogbox.frame = 0
	
	elif dialogname.text == "Hiya":
		dialogsprite.texture = hiya
		dialogsprite.visible = true
		dialogsprite.frame = expression
		dialogsprite.position.x = rightpos.position.x
		dialogtext.rect_position.x = -224
		dialogsprite.offset.x = -16
		dialogsprite.offset.y = -88
		dialogsprite.flip_h = false
		dialogsprite.scale = Vector2(1, 1)
		dialogsprite.hframes = 6
		dialogsprite.vframes = 1
		dialogbox.frame = 0
	
	elif dialogname.text == "Jackeron":
		dialogsprite.texture = jackaron
		dialogsprite.visible = true
		dialogsprite.frame = expression
		dialogsprite.position.x = rightpos.position.x
		dialogtext.rect_position.x = -224
		dialogsprite.offset.x = 0
		dialogsprite.offset.y = -64
		dialogsprite.flip_h = false
		dialogsprite.scale = Vector2(1.2, 1.2)
		dialogsprite.hframes = 6
		dialogsprite.vframes = 1
		dialogbox.frame = 0
	
	elif dialogname.text == "Zakaria":
		dialogsprite.texture = zakaria
		dialogsprite.visible = true
		dialogsprite.frame = expression
		dialogsprite.position.x = rightpos.position.x
		dialogtext.rect_position.x = -224
		dialogsprite.offset.x = -6
		dialogsprite.offset.y = -80
		dialogsprite.flip_h = false
		dialogsprite.scale = Vector2(1.2, 1.2)
		dialogsprite.hframes = 13
		dialogsprite.vframes = 1
		dialogbox.frame = 0
	
	elif dialogname.text == "Kai":
		dialogsprite.texture = janktopkai
		dialogsprite.visible = true
		dialogsprite.frame = expression
		dialogsprite.position.x = rightpos.position.x
		dialogtext.rect_position.x = -224
		dialogsprite.offset.x = -6
		dialogsprite.offset.y = -64
		dialogsprite.flip_h = false
		dialogsprite.scale = Vector2(1.2, 1.2)
		dialogsprite.hframes = 10
		dialogsprite.vframes = 1
		dialogbox.frame = 0
	
	elif dialogname.text == "Debt" or trigger == "Debt":
		dialogsprite.texture = debt
		dialogsprite.visible = true
		dialogsprite.frame = expression
		dialogsprite.position.x = rightpos.position.x
		dialogtext.rect_position.x = -224
		dialogsprite.offset.x = 0
		dialogsprite.offset.y = -64
		dialogsprite.flip_h = false
		dialogsprite.scale = Vector2(1.2, 1.2)
		dialogsprite.hframes = 3
		dialogsprite.vframes = 1
		dialogbox.frame = 0
	else:
		dialogtext.rect_position.x = -224
		dialogsprite.visible = false
		dialogbox.frame = 2


func mobile_buttons():
	if GlobalSettings.mobile:
		q.show()
	else:
		q.hide()


func load_dialogue():
	minigames()
	triggers()
	
	if dialogue_index < text.size():
		
		active = true
		finished = false
		
		dialogname.text = text[dialogue_index]["Name"]
		dialogtext.bbcode_text = str(text[dialogue_index]["Text"])
		expression = text[dialogue_index].Expressions
		trigger = text[dialogue_index]["Trigger"]
		
		dialogtimer.wait_time = text[dialogue_index].Speed
		
		dialogtext.percent_visible = 0
		dialogtimer.start()
		
		choice1.grab_focus()
	else:
		finished = true
		active = false
	dialogue_index += 1


func _on_Timer_timeout():
	if dialogtext.visible_characters >= dialogtext.get_total_character_count():
		dialogtimer.stop()
		finished = true
	else:
		dialogtext.visible_characters += 1
		textvc.play()


func _on_Choice1_pressed():
	if choice1.text == "Help":
		dialogue_index = 44
		load_dialogue()
	
	selected.play()


func _on_Choice2_pressed():
	if choice2.text == "Nah, let their pathetic asses be":
		dialogue_index = 42
		load_dialogue()
	
	selected.play()


func _on_Choice3_pressed():
	selected.play()


func _on_Choice4_pressed():
	selected.play()


func _on_Stuff_focus_entered():
	if choices.visible:
		selecting.play()

