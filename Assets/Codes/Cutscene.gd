extends CanvasLayer

var text = Dialogue.cutscene_dialogue_1

onready var trans = $Transition/Animation

onready var background = $Background
onready var interacter = $Sprite/Interacter
onready var dialogsprite = $Sprite
onready var dialogname = $Transition/Name
onready var dialogtext = $Transition/Text
onready var indicatortext = $Indicator
onready var timer = $Timer

onready var cutscenesprite = $CutsceneSprite
onready var cutsceneplayer = $CutsceneSprite/CutscenePlayer

onready var bubblynuts = $BubblyNuts
onready var groovynuts = $GroovyNuts
onready var spidernuts = $SpiderNuts
onready var textvc = $TextVC

onready var tutorialBorder = $Transition/Tutorial

onready var selecting = $Selecting
onready var selected = $Selected

onready var q = $Indicator/Q

var dialogue_index = 0
var finished
var active 

var expression = 0
var trigger = ""

var cut = false


func _ready():
	if Global.baa:
		baa_triggerer()
	if Global.gaa:
		gaa_triggerer()
	if Global.sack:
		sack_triggerer()
		interacter.disabled = true
	
	Global.cutscene = true
	trans.play("TransitionOut")
	
	indicatortext.visible = false
	get_tree().paused = true
	
	if GlobalSettings.mobile:
		q.show()
	else:
		q.hide()


func _process(delta):
	triggerer()
	
	if not cut:
		sprite()
	
	$Sprite/Escape.grab_click_focus()
	$Sprite/Escape.grab_focus()
	
	if GlobalSettings.mobile:
		q.show()
	else:
		q.hide()
	
	if Input.is_action_just_pressed("ui_accept"):
		if dialogtext.visible_characters == dialogtext.get_total_character_count():
			interacter.disabled = false
			load_dialogue()
			sprite()
	
	if Input.is_action_just_pressed("ui_block") and dialogtext != null:
		dialogtext.visible_characters = dialogtext.get_total_character_count()
	
	if Input.is_action_just_pressed("ui_skip") and dialogtext != null:
		if not tutorialBorder.visible:
			if text != null:
				dialogue_index = text.size() - 1
		
				trans.play("TransitionIn")
				load_dialogue()


func sprite():
	if expression == 1:
		dialogsprite.animation = "1"
		interacter.rect_position = Vector2(48, 18)
	elif expression == 2:
		dialogsprite.animation = "2"
		interacter.rect_position = Vector2(48, 18)
	elif expression == 3:
		dialogsprite.animation = "3"
		interacter.rect_position = Vector2(-20, 42)
	elif expression == 4:
		dialogsprite.animation = "4"
		interacter.rect_position = Vector2(-20, -30)
	elif expression == 5:
		dialogsprite.animation = "5"
		interacter.rect_position = Vector2(-20, -30)
	elif expression == 6:
		dialogsprite.animation = "6"
		interacter.rect_position = Vector2(-192, -6)
	elif expression == 7:
		dialogsprite.animation = "7"
		interacter.rect_position = Vector2(-20, -38)
	elif expression == 8:
		dialogsprite.animation = "8"
		interacter.rect_position = Vector2(-48, -22)
	elif expression == 9:
		dialogsprite.animation = "Sack 1"
		interacter.rect_position = Vector2(-48, -22)
	elif expression == 10:
		dialogsprite.animation = "Sack 2"
		interacter.rect_position = Vector2(-48, -22)
	elif expression == 11:
		dialogsprite.animation = "Sack 3"
		interacter.rect_position = Vector2(-48, -22)
	elif expression == 12:
		dialogsprite.animation = "Sack 4"
		interacter.rect_position = Vector2(-48, -22)
	elif expression == 13:
		dialogsprite.animation = "Sack 5"
		interacter.rect_position = Vector2(-48, -22)
	elif expression == 14:
		dialogsprite.animation = "Sack 6"
		interacter.rect_position = Vector2(-48, -22)


func triggerer():
	if trigger == "GroovyNuts":
		if not groovynuts.playing:
			groovynuts.play()
	
	if trigger == "BubblyNuts":
		if not bubblynuts.playing:
			bubblynuts.play()
	
	if trigger == "SpiderNuts":
		if not spidernuts.playing:
			spidernuts.play()
	
	if dialogsprite.animation == "3.5":
		yield(get_tree().create_timer(1),"timeout")
		
		if not $Scream.playing:
			$Scream.play()
			$Scream.pitch_scale = 1.2


func baa_triggerer():
	if PlayerStats.SECTION == 1 and not PlayerStats.TUTORIAL_PASSED:
		tutorialBorder.show()
		trans.stop()
	elif PlayerStats.SECTION == 1 and PlayerStats.TUTORIAL_PASSED:
		text = Dialogue.cutscene_dialogue_1
		
		tutorialBorder.hide()
		dialogue_index = 0
		dialogtext.text = ""
		dialogname.text = ""
		
		load_dialogue()
		
	if MidDialogue.trigger == "Cutscene 7_3":
		MidDialogue.load_dialogue()
		interacter.disabled = true
		
		cutscenesprite.show()
		dialogsprite.hide()
		
		cutsceneplayer.play("Cutscene 2")
		
		text = Dialogue.placeholder_dialogue2
	else:
		dialogsprite.show()
		cutscenesprite.hide()


func gaa_triggerer():
	tutorialBorder.hide()
	
	if GaaStats.SECTION == 1:
		text = Dialogue.cutscene_dialogue_2
		
		dialogue_index = 0
		dialogtext.text = ""
		dialogname.text = ""
		
		load_dialogue()


func sack_triggerer():
	tutorialBorder.hide()
	
	if SackStats.SECTION == 1:
		text = Dialogue.cutscene_dialogue_3
		
		dialogue_index = 0
		dialogtext.text = ""
		dialogname.text = ""
		
		load_dialogue()


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
		
		cut = false
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


func _on_Animation_animation_finished(anim_name):
	if anim_name == "TransitionOut":
		if tutorialBorder == null:
			load_dialogue()
		
		if trigger != "End":
			indicatortext.visible = true
	
	
	if anim_name == "TransitionIn":
		self.queue_free()
		Global.cutscene = false
		get_tree().paused = false
		trans.play("TransitionOut")
		
		if PlayerStats.SECTION == 10:
			get_tree().change_scene("res://Assets/Scenes/Sections/Section 11.tscn")


func _on_CutscenePlayer_animation_finished(anim_name):
	if anim_name == "Cutscene 2":
		trans.play("TransitionIn")


func _on_YesTutorial_pressed():
	get_tree().change_scene("res://Assets/Scenes/Sections/Section 0.tscn")
	get_tree().paused = false
	Global.cutscene = false
	
	PlayerStats.HAS_PLAYED = 0


func _on_NoTutorial_pressed():
	tutorialBorder.hide()
	
	dialogue_index = 0
	dialogtext.text = ""
	dialogname.text = ""
	
	trans.play("TransitionOut")
	
	load_dialogue()


func _on_Interacter_pressed():
	$Click.play()
	cut = true
	
	if expression == 1:
		dialogsprite.animation = "1.5"
		interacter.disabled = true
	
	elif expression == 2:
		dialogsprite.animation = "2.5"
		interacter.disabled = true
	
	elif expression == 3:
		dialogsprite.animation = "3.5"
		interacter.queue_free()
		
		PlayerStats.EXP += 5
		dialogue_index = 0
		dialogtext.text = ""
		dialogname.text = ""
		indicatortext.text = ""
		$Punch.play()
		text = null
		
		groovynuts.stop()
		
		yield(get_tree().create_timer(1.4),"timeout")
		get_tree().paused = false
		Global.cutscene = false
		self.queue_free()
	
	elif expression == 4:
		dialogsprite.animation = "5.5"
		interacter.disabled = true
		
		if not PlayerStats.HAPPYBAA:
			PlayerStats.HAPPYBAA = true
			Global.emit_signal("ACHIEVEMENT")
			Global.achieveddesc.text = "':D'"
			Global.achievedtitle.text = "Happy Baa"
			Global.achievedsprite.frame = 7
			Global.achievedsprite.show()
			
			PlayerStats.save_game()
	
	elif expression == 5:
		dialogsprite.animation = "5.5"
		interacter.disabled = true
		
		if PlayerStats.HAPPYBAA:
			PlayerStats.HAPPYBAA = true
			Global.emit_signal("ACHIEVEMENT")
			Global.achieveddesc.text = "':D'"
			Global.achievedtitle.text = "Happy Baa"
			Global.achievedsprite.frame = 7
			Global.achievedsprite.show()
			
			PlayerStats.save_game()
	
	elif expression == 6:
		dialogsprite.animation = "6.5"
		interacter.disabled = true
	
	elif expression == 7:
		dialogsprite.animation = "7.5"
		interacter.disabled = true
	
	elif expression == 8:
		dialogsprite.animation = "8.5"
		interacter.disabled = true


func _on_Stuff_focus_entered():
	selecting.play()


func _on_Stuff_mouse_entered():
	selecting.play()

