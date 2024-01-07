extends CanvasLayer

onready var bg = $Background

onready var anim = $Animation
onready var volbar = $Background/Holder/Options/General/VolumeBar
onready var sfxbar = $Background/Holder/Options/General/SFXBar
onready var brightbar = $Background/Holder/Options/General/BrightnessBar
onready var voltxt = $Background/Holder/Options/General/VolumeBar/VolumeCounter
onready var sfxtxt = $Background/Holder/Options/General/SFXBar/SFXCounter
onready var brighttxt = $Background/Holder/Options/General/BrightnessBar/BrightnessCounter

onready var expbar = $Background/Holder/Options/Stats/EXPBar
onready var expcount = $Background/Holder/Options/Stats/EXPBar/EXPCount
onready var llcount = $Background/Holder/Options/Stats/LLCount
onready var lscount = $Background/Holder/Options/Stats/LSCount
onready var hpcount = $Background/Holder/Options/Stats/HPCount
onready var stmcount = $Background/Holder/Options/Stats/STMCount
onready var moneycount = $Background/Holder/Options/Stats/MoneyCounter
onready var points = $Background/Holder/Options/Stats/PointCounter

onready var icon = $Background/Holder/Options/Stats/Icon
onready var character_name = $Background/Holder/Options/Stats/Name

onready var screenshake = $Background/Holder/Options/General/ScrollContainer/HBoxContainer/Screenshake
onready var lowquality = $Background/Holder/Options/General/ScrollContainer/HBoxContainer/LowQuality
onready var flashingfx = $Background/Holder/Options/General/ScrollContainer/HBoxContainer/FlashingEffects
onready var autopause = $Background/Holder/Options/General/ScrollContainer/HBoxContainer/AutoPause
onready var fpscounter = $Background/Holder/Options/General/ScrollContainer/HBoxContainer/FPSCounter

onready var memory1 = $Background/Holder/Options/Memories/Memory1
onready var memorycounter = $Background/Holder/Options/Memories/MemoriesCount

onready var selecting = $Selecting
onready var selected = $Selected
onready var click = $Click

onready var bgmusic = $BGMusic
onready var gaabgmusic = $GaaBGMusic
onready var sackbgmusic = $SackBGMusic

var openmenu = false

export var ENABLED = true


func _ready():
	if Global.baa:
		icon.play("Baa")
		icon.offset = Vector2(0, 0)
	if Global.gaa:
		icon.play("Gaa")
		icon.offset = Vector2(-1, 0)
	if Global.sack:
		icon.play("Sack")
		icon.offset = Vector2(0, 0)
	
	volbar.value = GlobalSettings.volume
	sfxbar.value = GlobalSettings.sfx
	brightbar.value = GlobalSettings.brightness
	
	screenshake.pressed = GlobalSettings.screenshake
	lowquality.pressed = GlobalSettings.lowquality
	flashingfx.pressed = GlobalSettings.flashingfx
	autopause.pressed = GlobalSettings.autopause
	fpscounter.pressed = GlobalSettings.fps
	
	bg.visible = false


func _process(_delta):
	memories()
	
	if not Global.cutscene and ENABLED:
		menu()
		stats()
	
	GlobalSettings.brightness = brightbar.value 
	GlobalSettings.volume = volbar.value 
	GlobalSettings.sfx = sfxbar.value
	
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
		
	elif brightbar.value == brightbar.min_value:
		brighttxt.text = str("Brightness: Meh")
	else:
		brighttxt.text = str("Brightness: ", GlobalSettings.brightness, "%")


func stats():
	if Global.sack:
		$Background/Holder/Options/Skills/Baa.hide()
		$Background/Holder/Options/Skills/Gaa.hide()
		$Background/Holder/Options/Skills/Sack.show()
		
		character_name.text = "Sack"
		
		expcount.text = str("| EXP: ", SackStats.EXP, " / ", SackStats.MAX_EXP, " |")
		llcount.text = str("Staff Level: ", SackStats.STAFF_LEVEL)
		hpcount.text = str("Health: ", SackStats.HP, " / ", SackStats.MAX_HP)
		stmcount.text = str("Stamina: ", SackStats.STM, " / ", SackStats.MAX_STM)
		moneycount.text = str("Cash: ", SackStats.CASH)
		points.text = str("Magic Points: ", SackStats.POINTS)
		
		lscount.text = str("Staff Strength: ", SackStats.STAFF_STRENGTH)
	
	if Global.gaa:
		$Background/Holder/Options/Skills/Baa.hide()
		$Background/Holder/Options/Skills/Gaa.show()
		$Background/Holder/Options/Skills/Sack.hide()
		
		expbar.value = GaaStats.EXP
		expbar.max_value = GaaStats.MAX_EXP
		
		character_name.text = "Gaa"
		
		expcount.text = str("| EXP: ", GaaStats.EXP, " / ", GaaStats.MAX_EXP, " |")
		llcount.text = str("Scythe Level: ", GaaStats.SCYTHE_LEVEL)
		hpcount.text = str("Health: ", GaaStats.HP, " / ", GaaStats.MAX_HP)
		stmcount.text = str("Stamina: ", GaaStats.STM, " / ", GaaStats.MAX_STM)
		moneycount.text = str("Cash: ", GaaStats.CASH)
		points.text = str("Kill Points: ", GaaStats.POINTS)
		
		lscount.text = str("Scythe Strength: ", GaaStats.SCYTHE_STRENGTH)
	
	if Global.baa:
		$Background/Holder/Options/Skills/Baa.show()
		$Background/Holder/Options/Skills/Gaa.hide()
		$Background/Holder/Options/Skills/Sack.hide()
		
		expbar.value = PlayerStats.EXP
		expbar.max_value = PlayerStats.MAX_EXP
		
		character_name.text = "Baa"
		
		expcount.text = str("| EXP: ", PlayerStats.EXP, " / ", PlayerStats.MAX_EXP, " |")
		llcount.text = str("Leg Level: ", PlayerStats.LEG_LEVEL)
		hpcount.text = str("Health: ", PlayerStats.HP, " / ", PlayerStats.MAX_HP)
		stmcount.text = str("Stamina: ", PlayerStats.STM, " / ", PlayerStats.MAX_STM)
		moneycount.text = str("Cash: ", PlayerStats.CASH)
		points.text = str("Kick Points: ", PlayerStats.POINTS)
		
		if PlayerStats.LEG_BOOST:
			lscount.text = str("Leg Strength: ", PlayerStats.LEG_STRENGTH, " (+",  PlayerStats.LEG_STRENGTH, ")")
		else:
			lscount.text = str("Leg Strength: ", PlayerStats.LEG_STRENGTH)


func menu():
	if Input.is_action_just_pressed("ui_menu") or Input.is_action_just_pressed("ui_cancel"):
		if not openmenu:
			enable_all_buttons()
			
			bg.visible = true
			anim.play("TransitionIn")
			openmenu = true
			
			if Global.baa:
				bgmusic.play()
			elif Global.gaa:
				gaabgmusic.play()
			elif Global.sack:
				sackbgmusic.play()
			
			get_tree().paused = true
			GlobalSettings.save_settings()
		else:
			disable_all_buttons()
			
			bg.visible = true
			anim.play("TransitionOut")
			openmenu = false
			
			bgmusic.stop()
			gaabgmusic.stop()
			sackbgmusic.stop()
			
			get_tree().paused = false
			GlobalSettings.save_settings()


func memories():
	memorycounter.text = str("Memories Found: ", PlayerStats.MEMORIES, " / 1")
	
	if PlayerStats.MEMORIES >= 1:
		memory1.frame = 1
	else:
		memory1.frame = 0


func disable_all_buttons():
	screenshake.disabled = true
	lowquality.disabled = true
	flashingfx.disabled = true
	autopause.disabled = true
	lowquality.disabled = true
	screenshake.disabled = true
	
	$Background/Holder/Options/Stats/HPCount/AddPoints.disabled = true
	$Background/Holder/Options/Stats/LSCount/AddPoints.disabled = true
	$Background/Holder/Options/General/QuitMenu.disabled = true


func enable_all_buttons():
	volbar.editable = true
	sfxbar.editable = true
	lowquality.disabled = false
	screenshake.disabled = false
	
	$Background/Holder/Options/Stats/HPCount/AddPoints.disabled = false
	$Background/Holder/Options/Stats/LSCount/AddPoints.disabled = false
	$Background/Holder/Options/General/QuitMenu.disabled = false


func _on_Back_pressed():
	disable_all_buttons()
	
	GlobalSettings.save_settings()
	
	anim.play("TransitionOut")
	openmenu = false
	bgmusic.stop()
	gaabgmusic.stop()
	sackbgmusic.stop()
	
	$Click.play()
	
	get_tree().paused = false


func _on_QuitMenu_pressed():
	get_tree().change_scene("res://Assets/Scenes/Menu/Menu.tscn")
	get_tree().paused = false
	
	MidDialogue.text = Dialogue.placeholder_dialogue
	MidDialogue.tutorialpoints = 0
	MidDialogue.dialogue_index = -1
	MidDialogue.load_dialogue()


func _on_Stuff_focus_entered():
	if openmenu:
		selecting.play()


func _on_Stuff_mouse_entered():
	if openmenu:
		selecting.play()


func _on_Stuff_toggled(_button_pressed):
	if openmenu:
		click.play()


func _on_Options_tab_changed(_tab):
	$Click.play()


func _on_AddDMGPoints_pressed():
	if Global.baa:
		if PlayerStats.POINTS > 0:
			PlayerStats.POINTS -= 1
			PlayerStats.LEG_STRENGTH += 1
			PlayerStats.save_game()
			
			$Click.play()
		else:
			$Error.play()
	if Global.gaa:
		if GaaStats.POINTS > 0:
			GaaStats.POINTS -= 1
			GaaStats.SCYTHE_STRENGTH += 2
			GaaStats.save_game()
			
			$Click.play()
		else:
			$Error.play()


func _on_AddHPPoints_pressed():
	if Global.baa:
		if PlayerStats.POINTS > 0:
			PlayerStats.POINTS -= 1
			PlayerStats.MAX_HP += 2
			
			PlayerStats.save_game()
			$Click.play()
		else:
			$Error.play()
	if Global.gaa:
		if GaaStats.POINTS > 0:
			GaaStats.POINTS -= 1
			GaaStats.MAX_HP += 1
			
			GaaStats.save_game()
			$Click.play()
		else:
			$Error.play()


func _on_ResetPoints_pressed():
	if Global.baa:
		PlayerStats.POINTS = PlayerStats.MAXPOINTS
		PlayerStats.LEG_STRENGTH = 25
		PlayerStats.MAX_HP = 100
		
		if PlayerStats.HP >= PlayerStats.MAX_HP:
			PlayerStats.HP = PlayerStats.MAX_HP
		
		PlayerStats.save_game()
		
		$Click.play()
	
	if Global.gaa:
		GaaStats.POINTS = GaaStats.MAXPOINTS
		GaaStats.SCYTHE_STRENGTH = 80
		GaaStats.MAX_HP = 50
		GaaStats.save_game()
		
		$Click.play()


func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)


func _on_VolumeBar_value_changed(value):
	volume(1, value)
	GlobalSettings.volume = value


func _on_SFXBar_value_changed(value):
	volume(2, value)
	GlobalSettings.sfx = value

