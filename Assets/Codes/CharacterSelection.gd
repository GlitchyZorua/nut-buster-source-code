extends Control

onready var baa = $Baa
onready var gaa = $Gaa
onready var sack = $Sack

onready var selectsfx = $Selecting
onready var selectedsfx = $Selected

onready var difficultyborder = $DifficultyBorder

onready var trans = $Transition/Animation

var change = 0
var enabled = true


func _ready():
	disable_all_buttons()
	
	PlayerStats.HP = PlayerStats.MAX_HP
	GaaStats.HP = GaaStats.MAX_HP
	SackStats.HP = SackStats.MAX_HP
	
	if not Global.menu.playing:
		Global.menu.play()
		Global.menu.pitch_scale = 1
	
	if GlobalSettings.screenshake:
		$Animation.play("Menu")
	else:
		$Animation.play("Menu Static")
	
	if not GlobalSettings.flashingfx:
		$Transition/ColorRect.queue_free()
	
	trans.play("TransitionOut")
	
	baa.frame = 0
	gaa.frame = 4
	sack.frame = 8


func _process(_delta):
	if baa.animation == "SeeBaa":
		baa.scale = Vector2(1.1, 1.1)
		sack.scale = Vector2(1, 1)
		gaa.scale = Vector2(1, 1)
	if gaa.animation == "SeeGaa":
		gaa.scale = Vector2(1.1, 1.1)
		sack.scale = Vector2(1, 1)
		baa.scale = Vector2(1, 1)
	if sack.animation == "SeeSack":
		sack.scale = Vector2(1.1, 1.1)
		gaa.scale = Vector2(1, 1)
		baa.scale = Vector2(1, 1)
	
	if Input.is_action_just_pressed("ui_cancel"):
		if not difficultyborder.visible:
			trans.play("TransitionIn")
			
			selectedsfx.play()
			change = 100
		else:
			difficultyborder.hide()
			enable_all_buttons()


func _on_Button_mouse_entered():
	if enabled:
		selectsfx.play()
		
		baa.animation = "SeeBaa"
		gaa.animation = "SeeBaa"
		sack.animation = "SeeBaa"


func _on_Button2_mouse_entered():
	if enabled:
		selectsfx.play()
		
		baa.animation = "SeeGaa"
		gaa.animation = "SeeGaa"
		sack.animation = "SeeGaa"


func _on_Button3_mouse_entered():
	if enabled:
		selectsfx.play()
		
		baa.animation = "SeeSack"
		gaa.animation = "SeeSack"
		sack.animation = "SeeSack"


func _on_Back_mouse_entered():
	if enabled:
		selectsfx.play()


func _on_Button_pressed():
	disable_all_buttons()
	
	Global.baa = true
	Global.gaa = false
	Global.sack = false
	
	baa.animation = "SeeBaa"
	gaa.animation = "SeeBaa"
	sack.animation = "SeeBaa"
	
	selectedsfx.play()
	
	change = 0
	
	difficultyborder.show()


func _on_Button2_pressed():
	disable_all_buttons()
	
	Global.baa = false
	Global.gaa = true
	Global.sack = false
	
	baa.animation = "SeeGaa"
	gaa.animation = "SeeGaa"
	sack.animation = "SeeGaa"
	
	selectedsfx.play()
	
	change = 1
	difficultyborder.show()


func _on_Button3_pressed():
	disable_all_buttons()
	
	Global.baa = false
	Global.gaa = false
	Global.sack = true
	
	selectedsfx.play()
	
	baa.animation = "SeeSack"
	gaa.animation = "SeeSack"
	sack.animation = "SeeSack"
	
	change = 2
	difficultyborder.show()


func _on_Back_pressed():
	disable_all_buttons()
	
	selectedsfx.play()
	
	change = 100
	trans.play("TransitionIn")


func _on_Animation_animation_finished(anim_name):
	if anim_name == "TransitionOut":
		enable_all_buttons()
		baa.get_node("Button2").grab_focus()
	
	if anim_name == "TransitionIn":
		if change == 0:
			if Global.baa:
				sections()
		if change == 1:
			if Global.gaa:
				gaa_sections()
		if change == 2:
			if Global.sack:
				sack_sections()
		if change == 100:
			get_tree().change_scene("res://Assets/Scenes/Menu/Menu.tscn")


func sections():
	if PlayerStats.SECTION != 0:
		get_tree().change_scene("res://Assets/Scenes/Sections/Section " + String(PlayerStats.SECTION) + ".tscn")
	if PlayerStats.SECTION == 0:
		get_tree().change_scene("res://Assets/Scenes/Sections/Section 1.tscn")


func gaa_sections():
	get_tree().change_scene("res://Assets/Scenes/Gaa Section/GaaSection " + String(GaaStats.SECTION) + ".tscn" )


func sack_sections():
	get_tree().change_scene("res://Assets/Scenes/Sack Section/SackSection " + String(SackStats.SECTION) + ".tscn")


func disable_all_buttons():
	enabled = false
	
	$Back.disabled = true
	$Baa/Button2.disabled = true
	$Gaa/Button2.disabled = true
	$Sack/Button2.disabled = true


func enable_all_buttons():
	enabled = true
	
	$Back.disabled = false
	$Baa/Button2.disabled = false
	$Gaa/Button2.disabled = false
	$Sack/Button2.disabled = false


func _on_Hard_pressed():
	if Global.baa:
		GlobalSettings.difficulty = 2
	if Global.gaa:
		GlobalSettings.gaadifficulty = 2
	if Global.sack:
		GlobalSettings.sackdifficulty = 2
	
	trans.play("TransitionIn")
	selectedsfx.play()
	
	$DifficultyBorder.hide()
	
	if GlobalSettings.screenshake:
		$Animation.play("Transition In")


func _on_Soft_pressed():
	if Global.baa:
		GlobalSettings.difficulty = 1
	if Global.gaa:
		GlobalSettings.gaadifficulty = 1
	if Global.sack:
		GlobalSettings.sackdifficulty = 1
	
	trans.play("TransitionIn")
	selectedsfx.play()
	
	$DifficultyBorder.hide()
	
	if GlobalSettings.screenshake:
		$Animation.play("Transition In")


func _on_Baby_pressed():
	if Global.baa:
		GlobalSettings.difficulty = 0
	if Global.gaa:
		GlobalSettings.gaadifficulty = 0
	if Global.sack:
		GlobalSettings.sackdifficulty = 0
	
	trans.play("TransitionIn")
	selectedsfx.play()
	
	$DifficultyBorder.hide()
	
	if GlobalSettings.screenshake:
		$Animation.play("Transition In")

