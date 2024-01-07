extends Control

var text = Dialogue.shop_dialogue_1

onready var spr = $Background
onready var border = $Border
onready var tween = $Tween
onready var trans = $Transition/Animation
onready var charanimation = $Animation

onready var option1 = $Border/Option1
onready var option2 = $Border/Option2
onready var option3 = $Border/Option3

onready var error = $Error

onready var selecting = $Selecting
onready var selected = $Selected

onready var dialogbox = $DialogueBox
onready var dialogsprite = $Background/Sprite
onready var dialogname = $DialogueBox/Name
onready var dialogtext = $DialogueBox/Text
onready var dialogtimer = $DialogueBox/Timer

export(String, FILE) var next_scene_path = ""

var dialogue_index = 0
var finished
var active 
var on_dialogue

var expression = 0
var trigger = ""


func _ready():
	if self.name == "LianaShopSection":
		text = Dialogue.shop_dialogue_1
	elif self.name == "MissQTShopSection":
		text = Dialogue.shop_dialogue_2
	Global.mainmusic.stop()
	
	charanimation.play("Greeting")
	trans.play("TransitionOut")


func _process(_delta):
	if option1.visible:
		option2.hide()
		option3.hide()
	
	if dialogtext.text != "":
		dialogsprite.frame = expression
	
	if trigger == "IPAddress":
		get_tree().change_scene("res://Assets/Scenes/Menu/IPAddress.tscn")
	
	if not option1.visible and not option2.visible:
		if on_dialogue:
			option3.hide()
			$Border/Back.hide()
		else:
			option3.show()
			$Border/Back.show()
	
	if Input.is_action_just_pressed("ui_accept") and dialogtext.text != "":
		if finished == true:
			load_dialogue()
	
	if Input.is_action_just_pressed("ui_block") and dialogtext != null:
		dialogtext.visible_characters = 9999
		finished = true
	
	if Input.is_action_pressed("ui_skip") and dialogtext.text != "":
		load_dialogue()
	
	$Border/Option2/Cash.text = str("Cash: " ,PlayerStats.CASH)


func load_dialogue():
	if trigger == "End":
		if self.name == "LianaShopSection":
			dialogue_index = 22
			on_dialogue = true
			
			tween.interpolate_property(dialogbox, "rect_position", Vector2(0, 208), Vector2(0, 320), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
			tween.interpolate_property(border, "rect_position", Vector2(512, 0), Vector2(256, 0), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
			tween.interpolate_property(spr, "position", Vector2(256, 150), Vector2(160, 150), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
			tween.start()
		
		if self.name == "MissQTShopSection":
			dialogue_index = 27
			on_dialogue = true
			
			tween.interpolate_property(dialogbox, "rect_position", Vector2(0, 208), Vector2(0, 320), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
			tween.interpolate_property(border, "rect_position", Vector2(512, 0), Vector2(256, 0), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
			tween.interpolate_property(spr, "position", Vector2(256, 150), Vector2(104, 150), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
			tween.start()
	
	if dialogue_index < text.size():
		active = true
		finished = false
		
		dialogname.text = text[dialogue_index]["Name"]
		dialogtext.bbcode_text = text[dialogue_index]["Text"]
		expression = text[dialogue_index].Expressions
		trigger = text[dialogue_index]["Trigger"]
		
		dialogtimer.wait_time = text[dialogue_index].Speed
		
		dialogtext.percent_visible = 0
		dialogtimer.start()
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
		$TextVC.play()


func _on_Buy_pressed():
	option1.visible = false
	option2.visible = true
	option3.visible = false


func _on_Talk_pressed():
	option1.visible = false
	option2.visible = false
	option3.visible = true


func _on_Back_pressed():
	$DialogueBox/BypassPress.grab_click_focus()
	$DialogueBox/BypassPress.grab_focus()
	
	if option1.visible:
		option1.visible = false
		option2.visible = false
		option3.visible = false
		
		on_dialogue = true
		
		if self.name == "LianaShopSection":
			tween.interpolate_property(dialogbox, "rect_position", Vector2(0, 320), Vector2(0, 208), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
			tween.interpolate_property(border, "rect_position", Vector2(288, 0), Vector2(512, 0), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
			tween.interpolate_property(spr, "position", Vector2(160, 150), Vector2(256, 150), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
			tween.start()
			
			dialogue_index = 29
		if self.name == "MissQTShopSection":
			tween.interpolate_property(dialogbox, "rect_position", Vector2(0, 320), Vector2(0, 208), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
			tween.interpolate_property(border, "rect_position", Vector2(288, 0), Vector2(512, 0), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
			tween.interpolate_property(spr, "position", Vector2(104, 150), Vector2(256, 150), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
			tween.start()
		
			dialogue_index = 28
		
		load_dialogue()
		selected.play()
		
		yield(get_tree().create_timer(2),"timeout")
		trans.play("TransitionIn")
	
	else:
		option1.visible = true
		option2.visible = false
		option3.visible = false


func _on_Animation_animation_finished(anim_name):
	if anim_name == "TransitionIn":
		get_tree().paused = false
		get_tree().change_scene(next_scene_path)


func _on_Buy1_pressed():
	if PlayerStats.CASH >= 25:
		PlayerStats.CASH -= 25
		PlayerStats.HP += 25 * PlayerStats.LEG_LEVEL
		
		selected.play()
		
		$Border/Option2/Item1/Buy1.text = "Buyyed"
		yield(get_tree().create_timer(2),"timeout")
		$Border/Option2/Item1/Buy1.text = "Buy"
	else:
		error.play()
		Global.camera.shake(120, 0.2)
		
		$Border/Option2/Item1/Buy1.text = "Error"
		yield(get_tree().create_timer(2),"timeout")
		$Border/Option2/Item1/Buy1.text = "Buy"

func _on_Buy2_pressed():
	if PlayerStats.CASH >= 85:
		PlayerStats.CASH -= 85
		PlayerStats.HP += 85 * PlayerStats.LEG_LEVEL
		
		selected.play()
		
		$Border/Option2/Item2/Buy2.text = "Buyyed"
		yield(get_tree().create_timer(2),"timeout")
		$Border/Option2/Item2/Buy2.text = "Buy"
	else:
		error.play()
		Global.camera.shake(120, 0.2)
		
		$Border/Option2/Item2/Buy2.text = "Error"
		yield(get_tree().create_timer(2),"timeout")
		$Border/Option2/Item2/Buy2.text = "Buy"

func _on_Buy3_pressed():
	if PlayerStats.CASH >= 250 and not PlayerStats.LEG_BOOST:
		PlayerStats.CASH -= 250
		PlayerStats.LEG_BOOST = true
		
		selected.play()
		
		$Border/Option2/Item3/Buy3.text = "Buyyed"
		yield(get_tree().create_timer(2),"timeout")
		$Border/Option2/Item3/Buy3.text = "Buy"
	else:
		error.play()
		Global.camera.shake(120, 0.2)
		
		$Border/Option2/Item3/Buy3.text = "Error"
		yield(get_tree().create_timer(2),"timeout")
		$Border/Option2/Item3/Buy3.text = "Buy"

func _on_Buy4_pressed():
	if PlayerStats.CASH >= 100000:
		if not PlayerStats.IPADDRESS:
			PlayerStats.IPADDRESS = true
			Global.emit_signal("ACHIEVEMENT")
			Global.achieveddesc.text = "'you somehow got liana's ip address"
			Global.achievedtitle.text = "YOU GOT MY IP ADDRESS!!"
			Global.achievedsprite.frame = 6
			Global.achievedsprite.show()
			
			PlayerStats.save_game()
		
		PlayerStats.CASH -= 100000
		
		selected.play()
		
		tween.interpolate_property(dialogbox, "rect_position", Vector2(0, 320), Vector2(0, 208), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(border, "rect_position", Vector2(288, 0), Vector2(512, 0), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(spr, "position", Vector2(160, 150), Vector2(256, 150), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.start()
		
		on_dialogue = true
		
		$DialogueBox/BypassPress.grab_click_focus()
		$DialogueBox/BypassPress.grab_focus()
		dialogbox.visible = true
		dialogue_index = 23
		
		load_dialogue()
		
		$Border/Option2/Item4/Buy4.text = "Buyyed"
		yield(get_tree().create_timer(2),"timeout")
		$Border/Option2/Item4/Buy4.text = "Buy"
	else:
		error.play()
		Global.camera.shake(120, 0.2)
		
		$Border/Option2/Item4/Buy4.text = "Error"
		yield(get_tree().create_timer(2),"timeout")
		$Border/Option2/Item4/Buy4.text = "Buy"


func _on_Stuff_focus_entered():
	selecting.play()


func _on_Stuff_mouse_entered():
	selecting.play()


func _on_CharacterAnimation_animation_finished(anim_name):
	if anim_name == "Greeting":
		if self.name == "LianaShopSection":
			charanimation.play("Idle")
			$BGMusic.play()
			
			tween.interpolate_property(border, "rect_position", Vector2(512, 0), Vector2(256, 0), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
			tween.interpolate_property(spr, "position", Vector2(256, 150), Vector2(160, 150), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
			tween.start()
		
		if self.name == "MissQTShopSection":
			charanimation.play("Idle")
			$BGMusic.play()
			
			tween.interpolate_property(border, "rect_position", Vector2(512, 0), Vector2(256, 0), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
			tween.interpolate_property(spr, "position", Vector2(256, 150), Vector2(104, 150), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
			tween.start()


func _on_Talk1_pressed():
	if self.name == "LianaShopSection":
		tween.interpolate_property(dialogbox, "rect_position", Vector2(0, 320), Vector2(0, 208), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(border, "rect_position", Vector2(288, 0), Vector2(512, 0), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(spr, "position", Vector2(160, 150), Vector2(256, 150), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.start()
	
		on_dialogue = true
		
		if $Border/Option3/Talk1.text == "Who are you":
			$DialogueBox/BypassPress.grab_click_focus()
			$DialogueBox/BypassPress.grab_focus()
			dialogbox.visible = true
			dialogue_index = 0
			
			yield(get_tree().create_timer(1.5),"timeout")
			load_dialogue()
	
	if self.name == "MissQTShopSection":
		tween.interpolate_property(dialogbox, "rect_position", Vector2(0, 320), Vector2(0, 208), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(border, "rect_position", Vector2(288, 0), Vector2(512, 0), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(spr, "position", Vector2(104, 150), Vector2(256, 150), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.start()
	
		on_dialogue = true
		
		if $Border/Option3/Talk1.text == "Why is your fur different?":
			$DialogueBox/BypassPress.grab_click_focus()
			$DialogueBox/BypassPress.grab_focus()
			dialogbox.visible = true
			dialogue_index = 0
			
			yield(get_tree().create_timer(1.5),"timeout")
			load_dialogue()

func _on_Talk2_pressed():
	if self.name == "LianaShopSection":
		tween.interpolate_property(dialogbox, "rect_position", Vector2(0, 320), Vector2(0, 208), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(border, "rect_position", Vector2(288, 0), Vector2(512, 0), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(spr, "position", Vector2(160, 150), Vector2(256, 150), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.start()
		
		on_dialogue = true
		
		if $Border/Option3/Talk2.text == "What are you":
			$DialogueBox/BypassPress.grab_click_focus()
			$DialogueBox/BypassPress.grab_focus()
			dialogbox.visible = true
			dialogue_index = 8
			yield(get_tree().create_timer(1.5),"timeout")
			load_dialogue()
	
	if self.name == "MissQTShopSection":
		tween.interpolate_property(dialogbox, "rect_position", Vector2(0, 320), Vector2(0, 208), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(border, "rect_position", Vector2(288, 0), Vector2(512, 0), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(spr, "position", Vector2(104, 150), Vector2(256, 150), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.start()
	
		on_dialogue = true
		
		if $Border/Option3/Talk2.text == "Do you own this shop?":
			$DialogueBox/BypassPress.grab_click_focus()
			$DialogueBox/BypassPress.grab_focus()
			dialogbox.visible = true
			dialogue_index = 9
			
			yield(get_tree().create_timer(1.5),"timeout")
			load_dialogue()

func _on_Talk3_pressed():
	if self.name == "LianaShopSection":
		tween.interpolate_property(dialogbox, "rect_position", Vector2(0, 320), Vector2(0, 208), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(border, "rect_position", Vector2(288, 0), Vector2(512, 0), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(spr, "position", Vector2(160, 150), Vector2(256, 150), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.start()
		
		on_dialogue = true
		
		if $Border/Option3/Talk3.text == "You look cute":
			$DialogueBox/BypassPress.grab_click_focus()
			$DialogueBox/BypassPress.grab_focus()
			dialogbox.visible = true
			dialogue_index = 12
			yield(get_tree().create_timer(1.5),"timeout")
			load_dialogue()
	
	if self.name == "MissQTShopSection":
		tween.interpolate_property(dialogbox, "rect_position", Vector2(0, 320), Vector2(0, 208), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(border, "rect_position", Vector2(288, 0), Vector2(512, 0), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(spr, "position", Vector2(104, 150), Vector2(256, 150), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.start()
	
		on_dialogue = true
		
		if $Border/Option3/Talk3.text == "How the heck do you have liana's ip?":
			$DialogueBox/BypassPress.grab_click_focus()
			$DialogueBox/BypassPress.grab_focus()
			dialogbox.visible = true
			dialogue_index = 17
			
			yield(get_tree().create_timer(1.5),"timeout")
			load_dialogue()

func _on_Talk4_pressed():
	if self.name == "LianaShopSection":
		tween.interpolate_property(dialogbox, "rect_position", Vector2(0, 320), Vector2(0, 208), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(border, "rect_position", Vector2(288, 0), Vector2(512, 0), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(spr, "position", Vector2(160, 150), Vector2(256, 150), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.start()
		
		on_dialogue = true
		
		if $Border/Option3/Talk4.text == "Why are you here":
			$DialogueBox/BypassPress.grab_click_focus()
			$DialogueBox/BypassPress.grab_focus()
			dialogbox.visible = true
			dialogue_index = 15
			yield(get_tree().create_timer(1.5),"timeout")
			load_dialogue()
	
	if self.name == "MissQTShopSection":
		tween.interpolate_property(dialogbox, "rect_position", Vector2(0, 320), Vector2(0, 208), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(border, "rect_position", Vector2(288, 0), Vector2(512, 0), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(spr, "position", Vector2(104, 150), Vector2(256, 150), 1.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.start()
	
		on_dialogue = true
		
		if $Border/Option3/Talk4.text == "WHY IS EVERYTHING SO EXPENSIVE?!":
			$DialogueBox/BypassPress.grab_click_focus()
			$DialogueBox/BypassPress.grab_focus()
			dialogbox.visible = true
			dialogue_index = 22
			
			yield(get_tree().create_timer(1.5),"timeout")
			load_dialogue()


func _on_Tween_tween_all_completed():
	if not option3.visible:
		if not option1.visible:
			on_dialogue = false

