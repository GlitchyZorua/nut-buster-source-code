extends Node2D

var cutscene = preload("res://Assets/Scenes/Misc/Cutscene.tscn")

onready var in_cutscene = $Cutscene

export(float) var section
export var shaking = false
export var no_music = false
export var time = 0.0
export(String, FILE) var music = ""


func _ready():
	Global.connect("TIME_HAS_ENDED", self, "time_has_ended")
	
	Engine.time_scale = 1
	if Global.menu.playing:
		Global.menu.stop()
	
	
	if Global.baa:
		PlayerStats.SECTION = section
		PlayerStats.save_game()
	
	if Global.gaa:
		GaaStats.SECTION = section
		GaaStats.save_game()
	
	if Global.sack:
		SackStats.SECTION = section
		SackStats.save_game()
	
	
	GlobalSettings.load_settings()
	MidDialogue.dialogue_index = 0
	play_music()
	
	
	if Global.baa:
		baa_event_triggers()
	if Global.gaa:
		gaa_event_triggers()
	if Global.sack:
		sack_event_triggers()


func _process(_delta):
	if in_cutscene != null:
		if Global.baa:
			baa_cutscene_trigger()
		if Global.gaa:
			gaa_cutscene_trigger()
		if Global.sack:
			sack_cutscene_trigger()


func _on_Cutscene_animation_finished(anim_name):
	if anim_name == "Cutscene 0":
		if in_cutscene != null:
			MidDialogue.text = Dialogue.dialogue_1
			MidDialogue.dialogue_index = 0
			MidDialogue.load_dialogue()
	
	if anim_name == "Cutscene 12_2":
		if in_cutscene != null:
			in_cutscene.play("Idle")
	
	
	if anim_name == "GaaCutscene_3":
		if in_cutscene != null:
			in_cutscene.play("Idle")
	
	
	if anim_name == "Sack Cutscene 1" or anim_name == "Sack Cutscene 1_2":
		if in_cutscene != null:
			in_cutscene.play("Idle")
	
	
	if anim_name == "Sack Cutscene 1_1":
		var cutscene_1 = cutscene.instance()
		self.add_child(cutscene_1)
		
		cutscene_1.text = Dialogue.cutscene_dialogue_3
		
		MidDialogue.load_dialogue()


func baa_cutscene_trigger():
	#---Cutscene 0---#
	
	if MidDialogue.trigger == "Cutscene 0_1":
		in_cutscene.play("Cutscene 0_1")
	if MidDialogue.trigger == "Cutscene 0_2":
		in_cutscene.play("Cutscene 0_2")
	if MidDialogue.trigger == "Retry":
		in_cutscene.play("Retry")
		
		if PlayerStats.HP < PlayerStats.MAX_HP:
			PlayerStats.HP = PlayerStats.MAX_HP
	
	#---Cutscene 2---#
	
	if MidDialogue.trigger == "Cutscene 2":
		in_cutscene.play("Cutscene 2")
	if MidDialogue.trigger == "Cutscene 2_5":
		in_cutscene.play("Cutscene 2_5")
	if MidDialogue.trigger == "Cutscene 2_6":
		in_cutscene.play("Cutscene 2_6")
	if MidDialogue.trigger == "Cutscene 2_7":
		in_cutscene.play("Cutscene 2_7")
	if MidDialogue.trigger == "Cutscene 2_8":
		in_cutscene.play("Cutscene 2_8")
	
	#---Cutscene 3---#
	
	if MidDialogue.trigger == "Cutscene 3_1":
		in_cutscene.play("Cutscene 3_1")
	if MidDialogue.trigger == "Cutscene 3_2":
		in_cutscene.play("Cutscene 3_2")
	if MidDialogue.trigger == "Cutscene 3_3":
		in_cutscene.play("Cutscene 3_3")
	
	#---Cutscene 4---#
	
	if MidDialogue.trigger == "Cutscene 4":
		in_cutscene.play("Cutscene 4")
	
	#---Cutscene 5---#
	
	if MidDialogue.trigger == "Cutscene 5":
		in_cutscene.play("Cutscene 5")
	
	#---Cutscene 6---#
	
	if MidDialogue.trigger == "Cutscene 6_1":
		in_cutscene.play("Cutscene 6_1")
	
	if MidDialogue.trigger == "Cutscene 6_2":
		in_cutscene.play("Cutscene 6_2")
	
	#---Cutscene 7---#
	
	if MidDialogue.trigger == "Cutscene 7_1":
		in_cutscene.play("Cutscene 7_1")
	
	if MidDialogue.trigger == "Cutscene 7_2":
		in_cutscene.play("Cutscene 7_2")
	
	#---Cutscene 8---#
	
	if MidDialogue.trigger == "Cutscene 8_1":
		in_cutscene.play("Cutscene 8_1")
	
	#---Cutscene 9---#
	
	if MidDialogue.trigger == "Cutscene 9_1":
		in_cutscene.play("Cutscene 9_1")
	
	if MidDialogue.trigger == "Cutscene 9_2":
		in_cutscene.play("Cutscene 9_2")
	
	if MidDialogue.trigger == "Explosion":
		in_cutscene.play("Explosion")
	
	#---Cutscene 10---#
	
	if MidDialogue.trigger == "Cutscene 10_1":
		in_cutscene.play("Cutscene 10_1")
	
	if MidDialogue.trigger == "Cutscene Time":
		in_cutscene.play("Cutscene_Time_Start")
	
	#---Cutscene 11---#
	
	if MidDialogue.trigger == "Cutscene 11_1":
		in_cutscene.play("Cutscene 11_1")
	
	if MidDialogue.trigger == "Cutscene 11_2":
		in_cutscene.play("Cutscene 11_2")
	
	if MidDialogue.trigger == "Cutscene 11_3":
		in_cutscene.play("Cutscene 11_3")
	
	if MidDialogue.trigger == "Cutscene 11_4":
		in_cutscene.play("Cutscene 11_4")
	
	if MidDialogue.trigger == "Cutscene 11_5":
		in_cutscene.play("Cutscene 11_5")
	
	if MidDialogue.trigger == "Cutscene 11_6":
		in_cutscene.play("Cutscene 11_6")
	
	#---Cutscene 12---#
	
	if MidDialogue.trigger == "Cutscene 12_1":
		in_cutscene.play("Cutscene 12_1")
	
	if MidDialogue.trigger == "Cutscene 12_2":
		in_cutscene.play("Cutscene 12_2")
	
	#---Cutscene 13---#
	
	if MidDialogue.trigger == "Cutscene 13_1":
		in_cutscene.play("Cutscene 13_1")
	if MidDialogue.trigger == "Cutscene 13_2":
		in_cutscene.play("Cutscene 13_2")
	if MidDialogue.trigger == "Cutscene 13_3":
		in_cutscene.play("Cutscene 13_3")
	if MidDialogue.trigger == "Cutscene 13_4":
		in_cutscene.play("Cutscene 13_4")
	if MidDialogue.trigger == "Cutscene 13_5":
		in_cutscene.play("Cutscene 13_5")
	
	#---Cutscene Triggers---#
	
	if MidDialogue.trigger == "Cutscene 7_3":
		$YSort/Sack/BGMusic.stop()
		
		var cutscene_2 = cutscene.instance()
		
		self.add_child(cutscene_2)
		cutscene_2.trans.play("StaticTransitionOut")
		cutscene_2.background.color = Color(0, 0, 0, 1)


func gaa_cutscene_trigger():
	#---CUTSCENE 2---#
	
	if MidDialogue.trigger == "GaaCutscene_2_5":
		in_cutscene.play("GaaCutscene_2_5")
	if MidDialogue.trigger == "GaaCutscene_2_6":
		in_cutscene.play("GaaCutscene_2_6")
		GaaStats.HAS_POWER = true
	
	#---CUTSCENE 3---#
	
	if MidDialogue.trigger == "GaaCutscene_3_1":
		in_cutscene.play("GaaCutscene_3_1")
	
	#---CUTSCENE 4---#
	
	if MidDialogue.trigger == "GaaCutscene_4":
		in_cutscene.play("GaaCutscene_4")
	if MidDialogue.trigger == "GaaCutscene_4_1":
		in_cutscene.play("GaaCutscene_4_1")
	if MidDialogue.trigger == "GaaCutscene_4_2":
		in_cutscene.play("GaaCutscene_4_2")
	if MidDialogue.trigger == "GaaCutscene_4_3":
		in_cutscene.play("GaaCutscene_4_3")


func sack_cutscene_trigger():
	if MidDialogue.trigger == "SackCutscene_1_1":
		in_cutscene.play("Sack Cutscene 1_1")
	if MidDialogue.trigger == "SackCutscene_1_2":
		in_cutscene.play("Sack Cutscene 1_2")
	if MidDialogue.trigger == "SackCutscene_1_3":
		in_cutscene.play("Sack Cutscene 1_3")
	if MidDialogue.trigger == "SackCutscene 1_4":
		in_cutscene.play("Sack Cutscene 1_4")
	if MidDialogue.trigger == "SackCutscene 1_5":
		in_cutscene.play("Sack Cutscene 1_5")
	if MidDialogue.trigger == "SackCutscene 1_6":
		in_cutscene.play("Sack Cutscene 1_6")


func _shake():
	if not shaking:
		Global.camera.shake(120, 0.5)
	else:
		Global.camera.shake(120, INF)


func baa_event_triggers():
	if in_cutscene != null:
		if section == 0:
			MidDialogue.text = Dialogue.placeholder_dialogue
			MidDialogue.tutorialpoints = 0
			
			in_cutscene.play("Cutscene 0")
		else:
			MidDialogue.tutorialpoints = -1
		
		
		if section == 1:
			if PlayerStats.HAS_PLAYED == 0:
				Global.player_initial_spawn_location = Vector2(80, 224)
				
				var cutscene_1 = cutscene.instance()
				self.add_child(cutscene_1)
				
				cutscene_1.text = Dialogue.cutscene_dialogue_1
				
				PlayerStats.HAS_PLAYED = 1
				
				in_cutscene.play("Cutscene 0_5")
		
		
		if section == 3:
			if PlayerStats.HAS_PLAYED == 1:
				in_cutscene.play("Cutscene 1")
				PlayerStats.HAS_PLAYED = 2
		
		
		if section == 3.5:
			if PlayerStats.BOSS_CLEARED < 1:
				in_cutscene.play("Extra Cutscene 1")
			elif PlayerStats.BOSS_CLEARED >= 1:
				in_cutscene.queue_free()
		
		
		if section == 5:
			if PlayerStats.HAS_PLAYED == 2:
				in_cutscene.play("Cutscene 1_5")
				MidDialogue.text = Dialogue.dialogue_2
				PlayerStats.HAS_PLAYED = 3
			else:
				in_cutscene.play("HpBar")
		
		
		if section == 5:
			MidDialogue.text = Dialogue.dialogue_2_5
		
		
		if section == 6:
			if PlayerStats.BEATED_SECTIONS == 0:
				PlayerStats.BEATED_SECTIONS = 1
				Global.emit_signal("ACHIEVEMENT")
				Global.achieveddesc.text = "'You beat section 1 of the game!'"
				Global.achievedtitle.text = "NUTKICKER"
				Global.achievedsprite.frame = 3
				Global.achievedsprite.show()
			
			if PlayerStats.HP < PlayerStats.MAX_HP:
				PlayerStats.HP = PlayerStats.MAX_HP
			
			if PlayerStats.HAS_PLAYED == 3:
				MidDialogue.text = Dialogue.dialogue_3
				in_cutscene.play("Cutscene 3")
				PlayerStats.HAS_PLAYED = 4
		
		
		if section == 8:
			if PlayerStats.HAS_PLAYED == 4:
				PlayerStats.HAS_PLAYED = 5
				get_node("Foregrounds/1/Darkness").visible = true
				in_cutscene.play("Cutscene 4_9")
			else:
				play_music()
		
		
		if section == 9:
			if PlayerStats.HAS_PLAYED == 5:
				PlayerStats.HAS_PLAYED = 6
				
				in_cutscene.play("Cutscene 6")
		
		
		if section == 12:
			if PlayerStats.HAS_PLAYED == 6:
				PlayerStats.HAS_PLAYED = 7
				
				in_cutscene.play("Cutscene 9")
			else:
				in_cutscene.play("Explosion")
		
		
		if section == 14:
			if not GlobalSettings.flashingfx:
				if get_node("Foregrounds/2/Blackness") != null:
					get_node("Foregrounds/2/Blackness").queue_free()
			
			if PlayerStats.HAS_PLAYED == 7:
				PlayerStats.HAS_PLAYED = 8
			
				in_cutscene.play("Cutscene 10")
				stop_music()
			else:
				in_cutscene.play("Shaking")
				time_has_started()
				play_music()
		
		
		if section == 15:
			in_cutscene.play("Shaking")
			time_has_started()
			play_music()
		
		
		if section == 16:
			Global.timer_stop()
			
			if PlayerStats.HAS_PLAYED == 8:
				PlayerStats.HAS_PLAYED = 9
			
				in_cutscene.play("Cutscene 11")
			else:
				in_cutscene.play("Start")
		
		
		if section == 17:
			if PlayerStats.HAS_PLAYED == 9:
				PlayerStats.HAS_PLAYED = 10
			
				in_cutscene.play("Cutscene 12")
			else:
				in_cutscene.play("Idle")
				$Mouseketeers.play()
		
		
		if section == 18:
			if PlayerStats.HAS_PLAYED == 10:
				PlayerStats.HAS_PLAYED = 11
			
				in_cutscene.play("Cutscene 12_3")
		
		if section == 18.1:
			if MinigameData.finished and MinigameData.tension >= 100:
				music = "res://Assets/Music/Rattalatta.mp3"
				Global.mainmusic.stream = load("res://Assets/Music/Rattalatta.mp3")
				
				if not Global.mainmusic.playing:
					Global.mainmusic.play()
		
		if section == 19:
			if PlayerStats.HAS_PLAYED == 11:
				PlayerStats.HAS_PLAYED = 12
			
				in_cutscene.play("Cutscene 13")
			else:
				in_cutscene.play("Cutscene 13")


func gaa_event_triggers():
	if section == 1:
		if GaaStats.HAS_PLAYED == 0:
			Global.player_initial_spawn_location = Vector2(104, 176)
			
			var cutscene_1 = cutscene.instance()
			self.add_child(cutscene_1)
			
			cutscene_1.text = Dialogue.cutscene_dialogue_2
			
			in_cutscene.play("GaaCutscene_1")
			
			GaaStats.HAS_PLAYED = 1
			
			play_music()
	
	if section == 3:
		if GaaStats.HAS_PLAYED == 1:
			in_cutscene.play("GaaCutscene_2")
			
			GaaStats.HAS_PLAYED = 2
	
	if section == 4:
		if GaaStats.HAS_PLAYED == 2:
			in_cutscene.play("GaaCutscene_3")
			
			GaaStats.HAS_PLAYED = 3
		else:
			in_cutscene.play("RESET")
		
		if GaaStats.HAS_PLAYED >= 4:
			in_cutscene.play("Has_Played")
	
	if section == 5:
		if GaaStats.HAS_PLAYED >= 4:
			in_cutscene.play("Has_Played")


func sack_event_triggers():
	if section == 1:
		if SackStats.HAS_PLAYED == 0:
			Global.player_initial_spawn_location = Vector2(272, 160)
			
			in_cutscene.play("Sack Cutscene 1")
			
			SackStats.HAS_PLAYED = 0


func play_music():
	if music != "" and Global.mainmusic.stream != load(music):
		Global.mainmusic.stream = load(music)
	elif music == "":
		Global.mainmusic.stream = null
	
	if not no_music:
		if not Global.mainmusic.playing:
			Global.mainmusic.play()
	else:
		if Global.mainmusic.playing:
			Global.mainmusic.stop()


func stop_music():
	Global.mainmusic.stop()


func _load_dialogue():
		#---Baa's Dialogue---#
	if Global.baa:
		if section == 0:
			MidDialogue.text = Dialogue.dialogue_1
			MidDialogue.load_dialogue()
		
		if section == 5:
			MidDialogue.text = Dialogue.dialogue_2
			MidDialogue.load_dialogue()
		
		if section == 5.5:
			MidDialogue.text = Dialogue.dialogue_2_5
			MidDialogue.load_dialogue()
		
		if section == 6:
			MidDialogue.text = Dialogue.dialogue_3
			MidDialogue.load_dialogue()
		
		if section == 7:
			MidDialogue.text = Dialogue.dialogue_4
			MidDialogue.load_dialogue()
		
		if section == 8:
			MidDialogue.text = Dialogue.dialogue_5
			MidDialogue.load_dialogue()
			
			in_cutscene.play("Sack Idle")
		
		if section == 9:
			MidDialogue.text = Dialogue.dialogue_6
			MidDialogue.load_dialogue()
		
		if section == 10:
			MidDialogue.text = Dialogue.dialogue_7
			MidDialogue.load_dialogue()
		
		if section == 11:
			MidDialogue.text = Dialogue.dialogue_8
			MidDialogue.load_dialogue()
		
		if section == 12:
			MidDialogue.text = Dialogue.dialogue_9
			MidDialogue.load_dialogue()
		
		if section == 14:
			MidDialogue.text = Dialogue.dialogue_11
			MidDialogue.load_dialogue()
		
		if section == 16:
			MidDialogue.text = Dialogue.dialogue_12
			MidDialogue.load_dialogue()
		
		if section == 17:
			MidDialogue.text = Dialogue.dialogue_13
			MidDialogue.load_dialogue()
		
		if section == 18:
			MidDialogue.text = Dialogue.dialogue_13_5
			MidDialogue.load_dialogue()
		
		if section == 19:
			MidDialogue.text = Dialogue.dialogue_15
			MidDialogue.load_dialogue()
		
		#---Gaa's Dialogue---#
	if Global.gaa:
		if section == 1:
			MidDialogue.text = Dialogue.gaa_dialogue_1
			MidDialogue.load_dialogue()
		
		if section == 3:
			MidDialogue.text = Dialogue.gaa_dialogue_3
			MidDialogue.load_dialogue()
		
		if section == 4:
			MidDialogue.text = Dialogue.gaa_dialogue_4
			MidDialogue.load_dialogue()
		
		if section == 5:
			MidDialogue.text = Dialogue.gaa_dialogue_5
			MidDialogue.load_dialogue()
			
			if GaaStats.HAS_PLAYED == 3:
				GaaStats.HAS_PLAYED = 4
		
		#---Sack's Dialogue---#
	if Global.sack:
		if section == 1:
			MidDialogue.text = Dialogue.sack_dialogue_1
			MidDialogue.load_dialogue()


func _alt_load_dialogue():
	if MidDialogue.dialogtext.text == "":
		
		#---Baa's Dialogue---#
		if Global.baa:
			if section == 5:
				MidDialogue.text = Dialogue.dialogue_2
				MidDialogue.load_dialogue()
			
			if section == 5.5:
				MidDialogue.text = Dialogue.dialogue_2_5
				MidDialogue.load_dialogue()
			
			if section == 6:
				MidDialogue.text = Dialogue.dialogue_3
				MidDialogue.load_dialogue()
			
			if section == 7:
				MidDialogue.text = Dialogue.dialogue_4
				MidDialogue.load_dialogue()
			
			if section == 8:
				MidDialogue.text = Dialogue.dialogue_5
				MidDialogue.load_dialogue()
				
				in_cutscene.play("Sack Idle")
			
			if section == 9:
				MidDialogue.text = Dialogue.dialogue_6
				MidDialogue.load_dialogue()
			
			if section == 10:
				MidDialogue.text = Dialogue.dialogue_7
				MidDialogue.load_dialogue()
			
			if section == 11:
				MidDialogue.text = Dialogue.dialogue_8
				MidDialogue.load_dialogue()
			
			if section == 12:
				MidDialogue.text = Dialogue.dialogue_9
				MidDialogue.load_dialogue()
			
			if section == 14:
				MidDialogue.text = Dialogue.dialogue_11
				MidDialogue.load_dialogue()
			
			if section == 16:
				MidDialogue.text = Dialogue.dialogue_12
				MidDialogue.load_dialogue()
		
		#---Gaa's Dialogue---#
		if Global.gaa:
			if section == 1:
				MidDialogue.text = Dialogue.gaa_dialogue_1
				MidDialogue.load_dialogue()
		
			if section == 3:
				MidDialogue.text = Dialogue.gaa_dialogue_3
				MidDialogue.load_dialogue()
		
		#---Sack's Dialogue---#
		if Global.sack:
			if section == 1:
				MidDialogue.text = Dialogue.sack_dialogue_1
				MidDialogue.load_dialogue()


func time_has_started():
	Global.timer_start(time)


func time_has_ended():
	in_cutscene.play("Jumpscare")

