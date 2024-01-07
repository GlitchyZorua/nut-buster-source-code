extends KinematicBody2D

var dmgindi = preload("res://Assets/Scenes/Misc/DamageIndicator.tscn")
var dashcloud = preload("res://Assets/Scenes/Misc/DashClouds.tscn")
var parryshield = preload("res://Assets/Scenes/Misc/ParryShield.tscn")
var impact = preload("res://Assets/Scenes/Misc/Impact.tscn")
var ghostfx = preload("res://Assets/Scenes/Misc/GhostFrames.tscn")
var clapemnuts = preload("res://Assets/Scenes/Attacks/Baa/ClapEmNuts.tscn")
var ultimate = preload("res://Assets/Scenes/Misc/UltimateMove.tscn")

var velocity = Vector2()
var inputVector = Vector2()
var knockback = Vector2.ZERO
var dashVelocity = Vector2.ZERO

var openmenu = false

export var UP = Vector2(0, -1)

export var ACCELERATION = 10000
export var SPEED = 250
export var MULTIPLIER = 1.0
export var PARRYTIMER = 0.15

export var STOP_ANIMATIONS = false
export var CUTSCENE = false
export var ENABLED = true
export var PARRY = false
export var BLOCK = false
export var TRANSFORMATION = false
export var ATTACKING = true
export var DASH = true
export var INVINCIBLE = false
export var STUNNED = false
export var IDLE = false
export var CLAPEM = false

export var RABI = false

onready var spr = $Sprite
onready var anim = $Animation
onready var dmgarea = $DamageArea
onready var cloudfx = $Cloud
onready var legcloudfx = $DamageArea/LegCloud
onready var hpbar = $HPBar
onready var stmbar = $STMBar
onready var shadow = $Shadow
onready var camera = $Camera
onready var colorfx = $Sprite/Transformation/ColorFX

onready var hurtsfx = $Hurt
onready var errorsfx = $Error

onready var parryindi = $Misc/ParryIndicator
onready var parrytween = $Misc/Tween
onready var targettext = $Misc/Target
onready var nohitsign = $Misc/Sign
onready var pausetimer = $PauseTimer

onready var transtween = $Sprite/Transformation/TransTween

onready var stmindi = $Misc/StaminaIndicator

var hurt = false
var dance = false
var is_dashing = false
var is_dash_attack = true
var is_literally_dashing_attacking = false
var jump = false
var train = false

var enemy = null
var enemy_teleport = null

var critical = 0
var combo = 0

export (NodePath) var joystickLeftPath
onready var joystickLeft : VirtualJoystick = get_node(joystickLeftPath)

export (NodePath) var joystickRightPath
onready var joystickRight : VirtualJoystick = get_node(joystickRightPath)


func _ready():
	Global.baa = true
	Global.gaa = false
	Global.sack = false
	
	Engine.time_scale = 1
	ENABLED = false
	
	if PlayerStats.HP <= 0:
		PlayerStats.HP = PlayerStats.MAX_HP
		
		hpbar.value = hpbar.max_value
		stmbar.value = stmbar.max_value
	
	self.global_position = Global.player_initial_spawn_location
	
	if not ENABLED:
		yield(get_tree().create_timer(0.5),"timeout")
		if not CUTSCENE:
			ENABLED = true
	
	hpbar.value = PlayerStats.HP
	hpbar.max_value = PlayerStats.MAX_HP
	
	stmbar.value = PlayerStats.STM
	stmbar.max_value = PlayerStats.MAX_STM
	
	dmgarea.knockback_vector = velocity
	
	Global.connect("PARRY", self, "parried")
	Global.connect("NO_HIT", self, "no_hit")
	
	PlayerStats.connect("LEVELUP", self, "levelup")


func _process(delta):
	stats()
	knockbacked(delta)
	transformation()
	block()
	
	if GlobalSettings.autopause:
		auto_pause()
	else:
		pausetimer.stop()
	
	if not CUTSCENE:
		if Input.is_action_pressed("ui_move_left"):
			spr.flip_h = true
		if Input.is_action_pressed("ui_move_right"):
			spr.flip_h = false
	
	if train:
		velocity = Vector2.ZERO
	
	if inputVector != Vector2(0, 0):
		dash_attack(delta)
	
	if nohitsign.frame == 15:
		nohitsign.frame = 0
		nohitsign.stop()
	
	if TRANSFORMATION:
		PlayerStats.STM -= 0.05
	elif not TRANSFORMATION:
		PlayerStats.STM += 0.05
	
	if Input.is_action_just_pressed("ui_reset") and Global.mainmusic.stream != load("res://Assets/Music/Juxtiposition.mp3"):
		get_tree().reload_current_scene()
		MidDialogue.text = Dialogue.placeholder_dialogue
		MidDialogue.tutorialpoints = 0
		MidDialogue.dialogue_index = -1
		MidDialogue.load_dialogue()
	
	if ENABLED and not MidDialogue.dialogbox.visible and not CUTSCENE:
		if not camera.smoothing_enabled:
			camera.smoothing_enabled = true
		
		if not BLOCK:
			if DASH == true:
				if inputVector != Vector2.ZERO:
					dash(delta)
			
			dashing_stop()
			
			if not IDLE:
				move(delta)
			if IDLE:
				anim.play("Idle")
			
			if not is_dashing:
				train()
			
			if PlayerStats.BEAT_SACK:
				tp_behind()
			
			if ATTACKING:
				attack()
				nut_shot()
				nutty_scream()
	
	if STOP_ANIMATIONS:
		anim.stop()
		cloudfx.emitting = false
		
		$Sprite/LevelIndicator.modulate = Color(1, 1, 1, 0)
	
	if MidDialogue.dialogbox.visible:
		if not CUTSCENE:
			if not RABI:
				anim.play("Idle")
			else:
				anim.play("Idle & Rabi")
			
			velocity = Vector2(0 ,0)
		
		if MidDialogue.trigger == "End":
			ENABLED = true
			CUTSCENE = false
	
	released_nutshot()


func stats():
	hpbar.value = PlayerStats.HP
	hpbar.max_value = PlayerStats.MAX_HP
	
	stmbar.value = PlayerStats.STM
	stmbar.max_value = PlayerStats.MAX_STM
	
	if PlayerStats.HP <= 0:
		PlayerStats.STM = PlayerStats.MAX_STM
	
	if stmbar.value < stmbar.max_value:
		stmbar.visible = true
	else:
		stmbar.visible = false
	
	if hpbar.value < hpbar.max_value:
		hpbar.visible = true
	else:
		hpbar.visible = false
	
	if stmbar.value <= stmbar.min_value:
		if TRANSFORMATION:
			TRANSFORMATION = false
			
			$GhostTimer.stop()
			
			transtween.interpolate_property(colorfx, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.3, Tween.TRANS_QUAD, Tween.EASE_IN)
			transtween.interpolate_property($DashLine, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.3, Tween.TRANS_QUAD, Tween.EASE_IN)
			transtween.start()
	
	if PlayerStats.HP > PlayerStats.MAX_HP:
		PlayerStats.HP = PlayerStats.MAX_HP
	
	if PlayerStats.STM > PlayerStats.MAX_STM - 0.05:
		PlayerStats.STM = PlayerStats.MAX_STM - 0.05
	
	if PlayerStats.BEAT_SACK:
		if enemy_teleport != null:
			if enemy_teleport.HP > 0:
				targettext.text = str("Target: ", enemy_teleport.name)
			
			if enemy_teleport.HP <= 0:
				enemy_teleport = null
				targettext.text = str("")
		else:
			targettext.text = str("")


func move(fps):
	if not jump:
		shadow.offset = spr.offset
	
	if not dance:
		inputVector.x = Input.get_action_strength("ui_move_right") - Input.get_action_strength("ui_move_left")
		inputVector.y = Input.get_action_strength("ui_move_down") - Input.get_action_strength("ui_move_up")
		
	velocity.x = move_toward(velocity.x, inputVector.x * SPEED, ACCELERATION * fps)
	velocity.y = move_toward(velocity.y, inputVector.y * SPEED, ACCELERATION * fps)
	
	if velocity.x == 0 or velocity.y == 0:
		if dance and not train:
			anim.play("Dance")
	
	if Input.is_action_just_pressed("ui_jump") and not jump and not dance and not train and PlayerStats.CAN_JUMP:
		anim.play("Jump")
		jump = true
	
	if not spr.flip_h:
		dmgarea.rotation_degrees = 0
		cloudfx.rotation_degrees = 225
		cloudfx.position = Vector2(-8, 16)
		dmgarea.knockback_vector = inputVector
		cloudfx.gravity.y = 98
		
		$DamageArea/SuperKick.flip_v = false
	
	if spr.flip_h:
		dmgarea.rotation_degrees = -180
		cloudfx.rotation_degrees = 315
		cloudfx.position = Vector2(8, 16)
		dmgarea.knockback_vector = inputVector
		cloudfx.gravity.y = -98
		
		$DamageArea/SuperKick.flip_v = true
	
	if joystickRight and joystickRight.is_pressed():
		rotation = joystickRight.get_output().angle()
	
	if velocity.x != 0 or velocity.y != 0:
		if not RABI and not jump and not train and not TRANSFORMATION:
			anim.play("Run")
		elif RABI:
			anim.play("Run & Rabi")
		elif TRANSFORMATION:
			anim.play("Run Nutbuster Mode")
		
		if dance:
			$Footstep.stop()
	
	elif velocity.x == 0 or velocity.y == 0:
		if not dance:
			if not RABI and not jump and not train and not TRANSFORMATION:
				anim.play("Idle")
			elif RABI:
				anim.play("Idle & Rabi")
			elif TRANSFORMATION:
				anim.play("Idle Nutbuster Mode")
	
	if velocity.x == 0 or velocity.y == 0:
		if Input.is_action_pressed("ui_move_left") and Input.is_action_pressed("ui_move_right"):
			if not RABI and not jump:
				cloudfx.emitting = false
				dance = true
		else:
			dance = false
	
	if not is_dash_attack:
		velocity = move_and_slide(velocity, UP)


func jump():
	collision_layer = 2
	is_dashing = false
	cloudfx.emitting = false
	
	$Node/Air.global_position = self.global_position


func dash(fps):
	if Input.is_action_just_pressed("ui_dash"):
		var dashfx = dashcloud.instance()
		get_parent().add_child(dashfx)
		
		if spr.flip_h:
			dashfx.rotation_degrees = 0
			dashfx.get_node("Sprite").rotation_degrees = 0
			dashfx.get_node("Sprite").flip_h = true
			dashVelocity = inputVector
		else:
			dashfx.rotation_degrees = -180
			dashfx.get_node("Sprite").rotation_degrees = -180
			dashfx.get_node("Sprite").flip_h = false
			dashVelocity = inputVector
		
		if TRANSFORMATION:
			velocity = dashVelocity * 3200
		else:
			velocity = dashVelocity * 1900
		
		is_dashing = true
		
		dashfx.global_position = self.global_position + spr.offset
		
		dashfx.emitting = true
		dashfx.one_shot = true
		
		dashfx.modulate = self.modulate
		
		dashfx.get_node("Sprite").frame = spr.frame
		dashfx.get_node("Tween").interpolate_property(dashfx.get_node("Sprite"), "modulate", Color(0, 0, 0, 1), Color(0, 0, 0, 0), 0.2, Tween.TRANS_QUAD, Tween.EASE_IN)
		dashfx.get_node("Tween").start()
		
		transtween.interpolate_property($DashLine, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.3, Tween.TRANS_QUAD, Tween.EASE_IN)
		transtween.start()
		
		if jump:
			$DashLine.hide()
		else:
			$DashLine.show()
		
		DASH = false
		INVINCIBLE = true
		
		$DashTimer.start()
		
		if not jump:
			$InvincibilityTimer.start()
		
		$Teleport.play()
	
	dashVelocity = dashVelocity.move_toward(Vector2.ZERO, 200 * fps)
	dashVelocity = move_and_slide(dashVelocity)


func no_hit():
	if not PlayerStats.DAMAGED and PlayerStats.DEATHS == 0:
		nohitsign.play()
		$NoHit.play()


func dashing_stop():
	if not RABI:
		if is_dashing:
			if spr.frame != 48:
				if not TRANSFORMATION:
					spr.frame = 49
				else:
					spr.frame =  88
			
			yield(get_tree().create_timer(0.3),"timeout")
			
			is_dashing = false


func nut_shot():
	if not CUTSCENE or not MidDialogue.dialogbox.visible or not ENABLED:
		if PlayerStats.LEG_LEVEL >= 3:
			if PlayerStats.STM >= 25:
				if Input.is_action_pressed("ui_decked"):
					spr.frame = 125
					ENABLED = false
					BLOCK = false
					
					velocity = Vector2.ZERO
					cloudfx.emitting = false
					anim.stop()
					
					if not spr.flip_h:
						dmgarea.rotation_degrees = 0
						cloudfx.rotation_degrees = 225
						cloudfx.position = Vector2(-8, 16)
						dmgarea.knockback_vector = inputVector
						cloudfx.gravity.y = 98
						
						$DamageArea/SuperKick.flip_v = false
				
					if spr.flip_h:
						dmgarea.rotation_degrees = -180
						cloudfx.rotation_degrees = 315
						cloudfx.position = Vector2(8, 16)
						dmgarea.knockback_vector = inputVector
						cloudfx.gravity.y = -98
						
						$DamageArea/SuperKick.flip_v = true
			
			elif PlayerStats.STM < 25:
				if Input.is_action_just_pressed("ui_decked"):
					stmindi.shake(120, 0.5)
					stmindi.show()
					errorsfx.play()


func released_nutshot():
	if not ENABLED and not MidDialogue.dialogbox.visible and not CUTSCENE:
		if PlayerStats.STM >= 25:
			if Input.is_action_just_released("ui_decked"):
				anim.play("Nut Shot")
				PlayerStats.STM -= 25
				
				ENABLED = false
				BLOCK = false
				
				Global.camera.shake(90, 0.2)
				
				if spr.flip_h:
					knockback = Vector2.RIGHT * 90
				else:
					knockback = Vector2.LEFT * 90
		
		elif PlayerStats.STM < 25:
			if Input.is_action_just_pressed("ui_decked"):
				stmindi.shake(120, 0.5)
				stmindi.show()
				errorsfx.play()


func nutty_scream():
	if PlayerStats.BEAT_ZERO:
		if PlayerStats.STM >= 50:
			if Input.is_action_just_pressed("ui_extra_skill_1"):
				anim.play("Nutty Scream")
				
				PlayerStats.STM -= 50
				
				ENABLED = false
				BLOCK = false
				velocity = Vector2.ZERO
			
		elif PlayerStats.STM <= 50:
			if Input.is_action_just_pressed("ui_extra_skill_1"):
				stmindi.shake(120, 0.5)
				stmindi.show()
				errorsfx.play()


func tp_behind():
	if PlayerStats.BEAT_SACK:
		if stmbar.value <= 25:
			if Input.is_action_just_pressed("ui_tp_behind"):
				stmindi.shake(120, 0.5)
				stmindi.show()
				
				errorsfx.play()
		
		if stmbar.value >= 25:
			if Input.is_action_just_pressed("ui_tp_behind"):
				if enemy_teleport != null:
					PlayerStats.STM -= 10
					
					var dashfx = dashcloud.instance()
					get_parent().add_child(dashfx)
					
					if spr.flip_h:
						dashfx.rotation_degrees = -180
						dashfx.get_node("Sprite").rotation_degrees = -180
						dashfx.get_node("Sprite").flip_h = true
						dmgarea.knockback_vector = Vector2.RIGHT
					else:
						dashfx.rotation_degrees = 0
						dashfx.get_node("Sprite").rotation_degrees = 0
						dashfx.get_node("Sprite").flip_h = false
						dmgarea.knockback_vector = Vector2.LEFT
					
					dashfx.global_position = self.global_position
					
					dashfx.emitting = true
					dashfx.one_shot = true
					
					dashfx.modulate = self.modulate
					
					dashfx.get_node("Sprite").frame = spr.frame
					dashfx.get_node("Tween").interpolate_property(dashfx.get_node("Sprite"), "modulate", Color(0, 0, 0, 1), Color(0, 0, 0, 0), 0.2, Tween.TRANS_QUAD, Tween.EASE_IN)
					dashfx.get_node("Tween").start()
					
					if enemy_teleport.spr.flip_h:
						self.global_position.x = enemy_teleport.global_position.x - 32
						self.global_position.y = enemy_teleport.global_position.y
						spr.flip_h = false
					elif not enemy_teleport.spr.flip_h:
						self.global_position.x = enemy_teleport.global_position.x + 32
						self.global_position.y = enemy_teleport.global_position.y
						spr.flip_h = true


func dash_attack(_fps):
	if not RABI and not jump and ATTACKING:
		if Input.is_action_just_pressed("ui_attack"):
			if stmbar.value <= 25 and is_dashing:
				stmindi.shake(120, 0.5)
				stmindi.show()
				
				errorsfx.play()
		
		if Input.is_action_just_pressed("ui_attack"):
			if stmbar.value > 25 and ENABLED:
				if PlayerStats.LEG_LEVEL >= 0:
					if is_dashing:
						if spr.flip_h:
							dashVelocity = Vector2.LEFT
						else:
							dashVelocity = Vector2.RIGHT
						
						velocity = dashVelocity * 800
						
						anim.play("Dash Attack")
						
						is_dashing = false
						is_dash_attack = true
						
						if MidDialogue.tutorialpoints == 2:
							is_literally_dashing_attacking = true
						
						PlayerStats.STM -= 20
						
						ENABLED = false
						
						DASH = false
						INVINCIBLE = true
						
						$DashTimer.start()
						$InvincibilityTimer.start()
						
						$Teleport.play()
	
	if not CUTSCENE:
		velocity = move_and_slide(velocity, UP)
	else:
		velocity = Vector2.ZERO
		cloudfx.emitting = false


func attack():
	if not jump:
		if Input.is_action_just_pressed("ui_attack"):
			if PlayerStats.LEG_LEVEL >= 0:
				velocity = Vector2(0, 0)
				combo += 1
				
				if not RABI and not TRANSFORMATION:
					if combo == 1:
						anim.play("NutKick")
					if combo == 2:
						anim.play("NutKick 2")
					if combo == 3:
						anim.play("NutKick 3")
						combo = 0
				elif RABI:
					anim.play("NutKick & Rabi")
				elif TRANSFORMATION:
					if combo == 1:
						anim.play("NutKick Nutbuster Mode")
					if combo == 2:
						anim.play("NutKick Nutbuster Mode 2")
					if combo == 3:
						anim.play("NutKick Nutbuster Mode 3")
						combo = 0
				
				ENABLED = false
				$AttackTimer.start()
		
		if Input.is_action_just_pressed("ui_sucker") and not RABI:
			if PlayerStats.LEG_LEVEL >= 1:
				if stmbar.value < 100:
					stmindi.shake(120, 0.5)
					stmindi.show()
					
					errorsfx.play()
				
				if stmbar.value >= 100:
					velocity = Vector2(0, 0)
					
					anim.play("Clap Em Nuts")
					
					var scenes = ultimate.instance()
					add_child(scenes)
					
					ENABLED = false
		
		if Input.is_action_just_pressed("ui_superkick") and not RABI:
			if PlayerStats.LEG_LEVEL >= 2:
				if stmbar.value <= 25:
					stmindi.shake(120, 0.5)
					stmindi.show()
					
					errorsfx.play()
				
				if stmbar.value >= 25:
					velocity = Vector2(0, 0)
					
					anim.play("Superkick")
					PlayerStats.STM -= 25
					
					ENABLED = false


func clap_em_nuts():
	var bigwind = clapemnuts.instance()
	get_parent().get_parent().add_child(bigwind)
	
	if spr.flip_h:
		bigwind.rotation_degrees = -630
	else:
		bigwind.rotation_degrees = -810
	
	bigwind.global_position = self.global_position
	PlayerStats.STM = 0


func block():
	if not is_dashing:
		if not Input.is_action_pressed("ui_block"):
			BLOCK = false
			PARRY = false
	
	if ENABLED and not MidDialogue.dialogbox.visible and not CUTSCENE:
		if not hurt:
			if not RABI and not jump:
				if is_dashing:
					if Input.is_action_pressed("ui_block"):
						velocity.x = lerp(velocity.x, 0, 0.05)
						spr.frame = 48
				
				if not is_dashing:
					if Input.is_action_just_released("ui_block"):
						if MidDialogue.tutorialpoints == 4:
							MidDialogue.tutorial(5)
					
					if Input.is_action_pressed("ui_block"):
						BLOCK = true
						
						if cloudfx.emitting:
							cloudfx.emitting = false
							
						velocity = Vector2(0, 0)
						anim.play("Block")
						
						$DamageArea/SuperKick.modulate.a = 0
						$Footstep.stop()
					
					if Input.is_action_just_pressed("ui_block"):
						PARRY = true
						yield(get_tree().create_timer(PARRYTIMER), "timeout")
						PARRY = false


func train():
	if Input.is_action_just_pressed("ui_train") and PlayerStats.MAX_STM < 500:
		if PlayerStats.STM >= 5 and not jump and not TRANSFORMATION:
			PlayerStats.MAX_STM += 0.1
			PlayerStats.STM -= 5
			PlayerStats.save_game()
			
			parryindi.modulate = Color(0, 0.56, 1, 1)
			parryindi.text = str("+0.1 STM")
			
			parrytween.interpolate_property(parryindi, "rect_scale", Vector2(1.2 , 1.2), Vector2(1 ,1), 0.4, Tween.TRANS_QUAD, Tween.EASE_IN)
			parrytween.interpolate_property(parryindi, "modulate", Color(0, 0.56, 1, 1), Color(0, 0.56, 1, 0), 0.6, Tween.TRANS_QUAD, Tween.EASE_IN)
			parrytween.start()
			
			anim.play("Push Up")
			
			ENABLED = false
			train = true
		
		elif PlayerStats.STM < 10:
			stmindi.shake(120, 0.5)
			stmindi.show()
			
			errorsfx.play()
	
	elif Input.is_action_just_pressed("ui_train") and PlayerStats.MAX_STM >= 500:
		parryindi.modulate = Color(1, 0, 0, 1)
		parryindi.text = str("MAX")
		
		parrytween.interpolate_property(parryindi, "rect_scale", Vector2(1.2 , 1.2), Vector2(1 ,1), 0.4, Tween.TRANS_QUAD, Tween.EASE_IN)
		parrytween.interpolate_property(parryindi, "modulate", Color(1, 0, 0, 1), Color(1, 0, 0, 0), 0.6, Tween.TRANS_QUAD, Tween.EASE_IN)
		parrytween.start()


func parried():
	if stmbar.value < stmbar.max_value:
		PlayerStats.STM += 10
	
	var shield = parryshield.instance()
	get_parent().add_child(shield)
	
	shield.global_position = self.global_position
	
	parrytween.interpolate_property(parryindi, "rect_scale", Vector2(1.2 , 1.2), Vector2(1 ,1), 0.4, Tween.TRANS_QUAD, Tween.EASE_IN)
	parrytween.start()
	
	parryindi.modulate = Color(1, 1, 1, 1)
	parryindi.text = str("NUTZZZ!!!")
	
	yield(get_tree().create_timer(0.4),"timeout")
	parrytween.stop_all()
	
	parrytween.interpolate_property(parryindi, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
	parrytween.start()


func critical():
	$Critical.play()
	
	parrytween.interpolate_property(parryindi, "rect_scale", Vector2(1.2 , 1.2), Vector2(1 ,1), 0.4, Tween.TRANS_QUAD, Tween.EASE_IN)
	parrytween.start()
	
	parryindi.modulate = Color(1, 1, 1, 1)
	parryindi.text = str("CRITIKALZ!!!")
	
	yield(get_tree().create_timer(0.4),"timeout")
	parrytween.stop_all()
	
	parrytween.interpolate_property(parryindi, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
	parrytween.start()


func stunned():
	parrytween.interpolate_property(parryindi, "rect_scale", Vector2(1.2 , 1.2), Vector2(1 ,1), 0.4, Tween.TRANS_QUAD, Tween.EASE_IN)
	parrytween.start()
	
	parryindi.modulate = Color(1, 0, 0, 1)
	parryindi.text = str("!!STUNNED!!")
	yield(get_tree().create_timer(0.4),"timeout")
	parrytween.stop_all()
	
	parrytween.interpolate_property(parryindi, "modulate", Color(1, 0, 0, 1), Color(1, 0, 0, 0), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
	parrytween.start()


func transformation():
	if TRANSFORMATION:
		SPEED = 250 * 2
		anim.playback_speed = 1.5
		legcloudfx.visible = true
	else:
		SPEED = 250
		anim.playback_speed = 1
		legcloudfx.visible = false
	
	if ENABLED and not MidDialogue.dialogbox.visible and not jump and ATTACKING:
		if PlayerStats.LEG_LEVEL >= 5:
			if not RABI:
				if Input.is_action_just_pressed("ui_transformation") and not TRANSFORMATION:
					if stmbar.value <= 50:
						stmindi.shake(120, 0.5)
						stmindi.show()
						
						errorsfx.play()
					
					if stmbar.value >= 50:
						Global.camera.shake(500, 0.2)
						anim.play("Transformation")
						PlayerStats.HP += 25
						
						$GhostTimer.start()
						
						TRANSFORMATION = true
						ENABLED = false
						
						PlayerStats.STM -= 50
	
	if MidDialogue.dialogbox.visible and TRANSFORMATION:
		TRANSFORMATION = false
		
		transtween.interpolate_property(colorfx, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.3, Tween.TRANS_QUAD, Tween.EASE_IN)
		transtween.interpolate_property($DashLine, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.3, Tween.TRANS_QUAD, Tween.EASE_IN)
		transtween.start()
		
		$GhostTimer.stop()


func knockbacked(fps):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * fps)
	knockback = move_and_slide(knockback)


func auto_pause():
	if Input.is_action_pressed("ui_literally_every_input"):
		pausetimer.start()


func levelup():
	if not RABI:
		anim.play("LevelUp")
		ENABLED = false


func _on_HPBar_value_changed(value):
	if hpbar.value <= hpbar.min_value:
		hurtsfx.pitch_scale = 0.6
		
		CUTSCENE = true
		
		$DeathMessage.show()
		$Camera.zoom = Vector2(0.5, 0.5)
		
		if BLOCK or STUNNED:
			get_tree().reload_current_scene()
	
	if hpbar.value < hpbar.max_value and hpbar.value >= hpbar.min_value:
		if ENABLED:
			PlayerStats.DAMAGED = true
			
			if MidDialogue.tutorialpoints == 5:
				MidDialogue.dialogue_index = 42
				MidDialogue.load_dialogue()
			
			train = false
			jump = false
			collision_layer = 2
			spr.offset = Vector2(1, 1)
			spr.scale = Vector2(1, 1)
			
			$Node/Air.visible = false
			
			if BLOCK and not STUNNED:
				if MidDialogue.tutorialpoints == 5:
					BLOCK = false
				
				if stmbar.value > 0:
					PlayerStats.STM -= 25
					$Dush.play()
				
				if stmbar.value <= stmbar.min_value:
					BLOCK = false
					STUNNED = true
					$Ding.play()
					
					stunned()
				
				Global.camera.shake(40, 0.2)
				
				$BlockTween.interpolate_property(spr, "modulate", Color(0, 0.16, 1, 1), Color(1, 1, 1, 1), 0.2, Tween.TRANS_QUAD, Tween.EASE_IN)
				$BlockTween.start()
			
			if not BLOCK:
				hurtsfx.play()
				
				hurt = true
				dance = false
				ENABLED = false
				is_dashing = false
				anim.play("Hurt")
				
				var impactframe = impact.instance()
				get_parent().add_child(impactframe)
				
				impactframe.global_position = self.global_position
				
				Global.camera.shake(120, 0.2)
				
				var damageindicator = dmgindi.instance()
				self.add_child(damageindicator)
				
				if enemy != null:
					damageindicator.amount = enemy.DAMAGE
				else:
					damageindicator.amount = 10 * PlayerStats.LEG_LEVEL
				
				damageindicator.position.y = -26
				
				Engine.time_scale = 0.1
				yield(get_tree().create_timer(0.05),"timeout")
				Engine.time_scale = 1


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Nut Shot":
		velocity = Vector2.ZERO
	
	if anim_name == "Push Up":
		train = false
		
		if MidDialogue.tutorialpoints == 3:
			MidDialogue.tutorial(4)
	
	if anim_name == "Jump":
		collision_layer = 2
		spr.offset = Vector2(1, 1)
		jump = false
		
		if INVINCIBLE:
			INVINCIBLE = false
	
	if anim_name == "Stunned":
		STUNNED = false
		hurt = false
	
	if anim_name == "Hurt":
		hurt = false
		
		velocity = Vector2(0 ,0)
		knockback = Vector2(0 ,0)
		
		if STUNNED:
			if stmbar.value < 10:
				hurt = true
				dance = false
				ENABLED = false
				is_dashing = false
				anim.play("Stunned")
			elif stmbar.value >= 10:
				hurt = false
				ENABLED = true
				STUNNED = false
		
		if hpbar.value <= hpbar.min_value:
			get_tree().reload_current_scene()
			
			PlayerStats.HP = PlayerStats.MAX_HP
			PlayerStats.DEATHS += 1
			
			MidDialogue.text = Dialogue.placeholder_dialogue
			MidDialogue.tutorialpoints = 0
			MidDialogue.dialogue_index = -1
			MidDialogue.load_dialogue()


func _on_DamageArea_body_entered(body):
	if body.is_in_group("DamagingTrash"):
		if body.ENABLED:
			if spr.flip_h:
				body.spr.flip_h = true
			else:
				body.spr.flip_h = false
			
			body.spr.flip_v = true
			body.knockback = Vector2.UP * 600
	
	if body.is_in_group("Trash"):
		if spr.flip_h:
			body.spr.flip_h = true
			body.knockback = Vector2.LEFT * 100
		else:
			body.spr.flip_h = false
			body.knockback = Vector2.RIGHT * 100
	
	if body.is_in_group("Barrel"):
		if spr.flip_h:
			body.spr.flip_h = true
			body.knockback = Vector2.LEFT * 400
		else:
			body.spr.flip_h = false
			body.knockback = Vector2.RIGHT * 400
	
	if body.is_in_group("Enemy") and body.HP > 0:
		critical = floor(rand_range(0, 11))
		
		if body.PARRY:
			if spr.flip_h:
				knockback = Vector2.RIGHT * 200
			else:
				knockback = Vector2.LEFT * 200
			
			anim.play("Hurt")
			
			var shield = parryshield.instance()
			get_parent().add_child(shield)
			
			if body.name == "Sack":
				shield.texture = shield.bubble_skin
			
			shield.global_position = self.global_position - Vector2(2, 0)
			
			
		if not body.PARRY:
			if not PlayerStats.LEG_BOOST:
				body.HP -= PlayerStats.LEG_STRENGTH * MULTIPLIER
			else:
				body.HP -= PlayerStats.LEG_STRENGTH * 2
			
			if TRANSFORMATION:
				body.HP -= PlayerStats.LEG_STRENGTH * 2
			
			if critical == 1:
				body.HP -= PlayerStats.LEG_STRENGTH * MULTIPLIER * 2
				critical()
				
				if not PlayerStats.FIRSTCRITIKAL:
					PlayerStats.FIRSTCRITIKAL = true
					Global.emit_signal("ACHIEVEMENT")
					Global.achieveddesc.text = "'You got your first critical hit!'"
					Global.achievedtitle.text = "OOOH YEAAAAAH"
					Global.achievedsprite.frame = 9
					Global.achievedsprite.show()
					
					PlayerStats.save_game()
			
			if spr.flip_h:
				body.spr.flip_h = true
				body.knockback = Vector2.LEFT * 200
			else:
				body.spr.flip_h = false
				body.knockback = Vector2.RIGHT * 200


func _on_HurtArea_body_entered(body):
	if body.is_in_group("Enemy"):
		enemy = body


func _on_HurtArea_body_exited(body):
	if body.is_in_group("Enemy"):
		enemy = null


func _on_GhostTimer_timeout():
	var ghostframes = ghostfx.instance()
	get_parent().add_child(ghostframes)
	
	ghostframes.global_position = self.global_position
	
	ghostframes.texture = spr.texture
	ghostframes.hframes = spr.hframes
	ghostframes.vframes = spr.vframes
	ghostframes.offset = spr.offset
	ghostframes.frame = spr.frame
	ghostframes.flip_h = spr.flip_h


func _on_DashTimer_timeout():
	if not DASH:
		DASH = true
		$DashTimer.stop()
		
		if MidDialogue.tutorialpoints == 1:
			MidDialogue.tutorial(2)
		
		if is_literally_dashing_attacking:
			if MidDialogue.tutorialpoints == 2:
				MidDialogue.tutorial(3)
				is_literally_dashing_attacking = false


func _on_AttackTimer_timeout():
	if combo > 0:
		combo = 0


func _on_InvincibilityTimer_timeout():
	INVINCIBLE = false
	$InvincibilityTimer.stop()
	
	transtween.interpolate_property($DashLine, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.3, Tween.TRANS_QUAD, Tween.EASE_IN)
	transtween.start()


func _on_PauseTimer_timeout():
	if GlobalSettings.autopause:
		$MiniMenu/Animation.play("TransitionIn")
		$MiniMenu.openmenu = true
		
		$MiniMenu.enable_all_buttons()
		
		$MiniMenu.bg.visible = true
		
		if Global.baa:
			$MiniMenu.bgmusic.play()
		elif Global.gaa:
			$MiniMenu.gaabgmusic.play()
		
		get_tree().paused = true
		GlobalSettings.save_settings()


func _on_TeleportArea_body_entered(body):
	if body.is_in_group("Enemy"):
		enemy_teleport = body

