extends Control

onready var trans = $Transition/Animation

onready var resettingsborder = $Holder/Container/General/Reset/ResettingBorder
onready var gaa = $Holder/Container/General/Reset/ResettingBorder/Gaa
onready var baa = $Holder/Container/General/Reset/ResettingBorder/Baa
onready var sack = $Holder/Container/General/Reset/ResettingBorder/Sack

onready var sfxbar = $Holder/Container/General/SFXBar
onready var volbar = $Holder/Container/General/VolumeBar
onready var brightbar = $Holder/Container/General/BrightnessBar

onready var sfxtxt = $Holder/Container/General/SFXBar/SFXCounter
onready var voltxt = $Holder/Container/General/VolumeBar/VolumeCounter
onready var brighttxt = $Holder/Container/General/BrightnessBar/BrightnessCounter

onready var screenshake = $Holder/Container/General/ScrollContainer/HBoxContainer/Screenshake
onready var lowquality = $Holder/Container/General/ScrollContainer/HBoxContainer/LowQuality
onready var flashingfx = $Holder/Container/General/ScrollContainer/HBoxContainer/FlashingEffects
onready var autopause = $Holder/Container/General/ScrollContainer/HBoxContainer/AutoPause
onready var fpscounter = $Holder/Container/General/ScrollContainer/HBoxContainer/FPSCounter

onready var selecting = $Selecting
onready var selected = $Selected
onready var click = $Click


func _ready():
	GlobalSettings.load_settings()
	
	trans.play("TransitionOut")
	
	volbar.value = GlobalSettings.volume
	sfxbar.value = GlobalSettings.sfx
	brightbar.value = GlobalSettings.brightness
	
	screenshake.pressed = GlobalSettings.screenshake
	lowquality.pressed = GlobalSettings.lowquality
	flashingfx.pressed = GlobalSettings.flashingfx
	autopause.pressed = GlobalSettings.autopause
	fpscounter.pressed = GlobalSettings.fps
	
	volbar.grab_focus()
	resettingsborder.hide()


func _process(_delta):
	GlobalSettings.brightness = brightbar.value 
	
	GlobalSettings.screenshake = screenshake.pressed
	GlobalSettings.lowquality = lowquality.pressed
	GlobalSettings.flashingfx = flashingfx.pressed
	GlobalSettings.autopause = autopause.pressed
	GlobalSettings.fps = fpscounter.pressed
	
	if volbar.value == volbar.max_value:
		voltxt.text = str("Volume: AAAAAA")
		
		if not PlayerStats.DEAF:
			PlayerStats.DEAF = true
			Global.emit_signal("ACHIEVEMENT")
			Global.achieveddesc.text = "Why did you turned the volume to the highest"
			Global.achievedtitle.text = "'ARE YOU DEAF?!'"
			Global.achievedsprite.frame = 5
			Global.achievedsprite.show()
			
			PlayerStats.save_game()
		
	elif volbar.value == volbar.min_value:
		voltxt.text = str("Volume: Shhhhh")
	else:
		voltxt.text = str("Volume: ", GlobalSettings.volume + 50, "%")
	
	if sfxbar.value == sfxbar.max_value:
		sfxtxt.text = str("SFX: AAAAAA")
		
		if not PlayerStats.DEAF:
			PlayerStats.DEAF = true
			Global.emit_signal("ACHIEVEMENT")
			Global.achieveddesc.text = "Why did you turned the volume to the highest"
			Global.achievedtitle.text = "'ARE YOU DEAF?!'"
			Global.achievedsprite.frame = 5
			Global.achievedsprite.show()
			
			PlayerStats.save_game()
	
	elif sfxbar.value == sfxbar.min_value:
		sfxtxt.text = str("SFX: Shhhhh")
	else:
		sfxtxt.text = str("SFX: ", GlobalSettings.sfx + 50, "%")
	
	if brightbar.value == brightbar.max_value:
		brighttxt.text = str("Brightness: My GOD AAAAAAAY7R97823HFIUWFQ37YT3")
	
		if not PlayerStats.FLASHED:
			PlayerStats.FLASHED = true
			Global.emit_signal("ACHIEVEMENT")
			Global.achieveddesc.text = "Oh my god why is it SO bright in here"
			Global.achievedtitle.text = "'Get Flashbanged'"
			Global.achievedsprite.frame = 4
			Global.achievedsprite.show()
			
			PlayerStats.save_game()
		
	elif brightbar.value == brightbar.min_value:
		brighttxt.text = str("Brightness: Meh")
	else:
		brighttxt.text = str("Brightness: ", GlobalSettings.brightness, "%")
	
	if Input.is_action_just_pressed("ui_cancel"):
		trans.play("TransitionIn")
		
		GlobalSettings.save_settings()


func _on_Animation_animation_finished(anim_name):
	if anim_name == "TransitionIn":
		get_tree().change_scene("res://Assets/Scenes/Menu/Menu.tscn")


func _on_Back_pressed():
	if not resettingsborder.visible:
		screenshake.disabled = true
		lowquality.disabled = true
		flashingfx.disabled = true
		autopause.disabled = true
		sfxbar.editable = false
		volbar.editable = false
		
		$Holder/Container/General/Reset.disabled = true
		$Holder/Back.disabled = true
		
		trans.play("TransitionIn")
		selected.play()
		
		GlobalSettings.save_settings()
	
	if resettingsborder.visible:
		resettingsborder.hide()
		$Click.play()


func _on_Stuff_focus_entered():
	selecting.play()


func _on_Stuff_mouse_entered():
	selecting.play()


func _on_Stuff_pressed():
	$Click.play()


func _on_Reset_pressed():
	click.play()
	resettingsborder.show()


func baa_data_reset():
	PlayerStats.LEG_LEVEL = 1
	PlayerStats.LEG_BOOST = false
	PlayerStats.BEAT_SACK = false
	PlayerStats.HAS_MET_LIANA = false
	PlayerStats.FLASHED = false
	PlayerStats.DEAF = false
	PlayerStats.LEG_STRENGTH = 25
	PlayerStats.MAX_EXP = 1000
	PlayerStats.EXP = 0
	PlayerStats.MAX_HP = 100
	PlayerStats.HP = 100
	PlayerStats.STM = 100
	PlayerStats.MAX_STM = 100
	PlayerStats.HAS_PLAYED = 0
	PlayerStats.SECTION = 0
	PlayerStats.CASH = 25
	PlayerStats.MEMORIES = 0
	PlayerStats.BOSS_CLEARED = 0
	PlayerStats.DEATHS = 0
	PlayerStats.POINTS = 0
	PlayerStats.MAXPOINTS = 0


func gaa_data_reset():
	GaaStats.SCYTHE_LEVEL = 1
	GaaStats.SCYTHE_STRENGTH = 80
	GaaStats.MAX_EXP = 1000
	GaaStats.EXP = 0
	GaaStats.MAX_HP = 100
	GaaStats.HP = 100
	GaaStats.HAS_PLAYED = 0
	GaaStats.SECTION = 1
	GaaStats.CASH = 100
	GaaStats.MEMORIES = 0
	GaaStats.KILLED = 0
	GaaStats.BOSS_CLEARED = 0
	GaaStats.DEATHS = 0
	GaaStats.POINTS = 0
	GaaStats.MAXPOINTS = 0
	GaaStats.HAS_POWER = false


func sack_data_reset():
	SackStats.STAFF_LEVEL = 1
	SackStats.STAFF_STRENGTH = 5
	SackStats.MAX_EXP = 1000
	SackStats.EXP = 0
	SackStats.MAX_HP = 250
	SackStats.HP = 250
	SackStats.HAS_PLAYED = 0
	SackStats.SECTION = 1
	SackStats.CASH = 0
	SackStats.MEMORIES = 0
	SackStats.BOSS_CLEARED = 0
	SackStats.DEATHS = 0


func _on_Gaa_Selecting_pressed():
	gaa_data_reset()
	GaaStats.save_game()
	
	resettingsborder.hide()
	selected.play()
	
	$Holder/Container/General/Reset.text = "Data Resetted"
	yield(get_tree().create_timer(2),"timeout")
	$Holder/Container/General/Reset.text = "Reset"

func _on_Gaa_Selecting_mouse_entered():
	selecting.play()
	
	gaa.frame = 1
	baa.frame = 2
	sack.frame = 4


func _on_Baa_Selecting_pressed():
	baa_data_reset()
	PlayerStats.save_game()
	
	resettingsborder.hide()
	selected.play()
	
	$Holder/Container/General/Reset.text = "Data Resetted"
	yield(get_tree().create_timer(2),"timeout")
	$Holder/Container/General/Reset.text = "Reset"

func _on_Baa_Selecting_mouse_entered():
	selecting.play()
	
	gaa.frame = 0
	baa.frame = 3
	sack.frame = 4


func _on_Sack_Selecting_pressed():
	sack_data_reset()
	SackStats.save_game()
	
	Global.camera.shake(100, 2)
	$Holder/Container/General/Reset/ResettingBorder/Sack/Animation.play("Jumpscare")
	
	resettingsborder.hide()
	
	if Global.menu.playing:
		Global.menu.stop()

func _on_Sack_Selecting_mouse_entered():
	selecting.play()
	
	gaa.frame = 0
	baa.frame = 2
	sack.frame = 5


func _on_Selecting_mouse_exited():
	gaa.frame = 0
	baa.frame = 2
	sack.frame = 4


func _on_JumpscareAnimation_animation_finished(anim_name):
	if anim_name == "Jumpscare":
		selected.play()
		
		$Holder/Container/General/Reset.text = "Data Resetted"
		yield(get_tree().create_timer(2),"timeout")
		$Holder/Container/General/Reset.text = "Reset"
		
		if not Global.menu.playing:
			Global.menu.play()


func _on_Container_tab_changed(tab):
	$Click.play()


func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)


func _on_VolumeBar_value_changed(value):
	volume(1, value)
	GlobalSettings.volume = value


func _on_SFXBar_value_changed(value):
	volume(2, value)
	GlobalSettings.sfx = value

