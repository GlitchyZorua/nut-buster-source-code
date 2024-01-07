extends KinematicBody2D

var dmgindi = preload("res://Assets/Scenes/Misc/DamageIndicator.tscn")
var dashcloud = preload("res://Assets/Scenes/Misc/DashClouds.tscn")
var parryshield = preload("res://Assets/Scenes/Misc/ParryShield.tscn")
var impact = preload("res://Assets/Scenes/Misc/Impact.tscn")
var ghostfx = preload("res://Assets/Scenes/Misc/GhostFrames.tscn")
var spears = preload("res://Assets/Scenes/Attacks/Gaa/GaaSpear.tscn")
var big_slash = preload("res://Assets/Scenes/Attacks/Gaa/GaaBigSlash.tscn")

var openmenu = false

var velocity = Vector2()
var inputVector = Vector2()
var knockback = Vector2.ZERO
var dashVelocity = Vector2.ZERO

export var UP = Vector2(0, -1)

export var ACCELERATION = 10000
export var SPEED = 100
export var MULTIPLIER = 1.0
export var PARRYTIMER = 0.15

export var STOP_ANIMATIONS = false
export var CUTSCENE = false
export var ENABLED = true
export var PARRY = false
export var BLOCK = false
export var STUNNED = false
export var TRANSFORMATION = false
export var ATTACKING = true
export var ATTACK = false
export var DASH = true
export var INVINCIBLE = false

onready var spr = $Sprite
onready var anim = $Animation
onready var dmgarea = $DamageArea
onready var beacon = $DamageArea/PowBeacon
onready var hpbar = $HPBar
onready var stmbar = $STMBar
onready var shadow = $Shadow
onready var cloudfx = $Cloud
onready var camera = $Camera
onready var colorfx = $Misc/ColorFX

onready var hurtsfx = $Hurt
onready var errorsfx = $Error
onready var theme = $BGMusic

onready var parryindi = $Misc/ParryIndicator
onready var parrytween = $Misc/Tween
onready var targettext = $Misc/Target
onready var nohitsign = $Misc/Sign
onready var almostdead = $Misc/AlmostDead

onready var transtween = $Sprite/TransTween
onready var deadtween = $Misc/AlmostDead/Tween

onready var stmindi = $Misc/StaminaIndicator

var hurt = false
var is_dashing = false
var is_dash_attack = true

var enemy = null
var enemy_teleport = null

var critical = 0
var combo = 0

export (NodePath) var joystickLeftPath
onready var joystickLeft : VirtualJoystick = get_node(joystickLeftPath)

export (NodePath) var joystickRightPath
onready var joystickRight : VirtualJoystick = get_node(joystickRightPath)


func _ready():
	Global.baa = false
	Global.gaa = true
	Global.sack = false
	
	ENABLED = false
	Engine.time_scale = 1
	
	if GaaStats.HP <= 0:
		GaaStats.HP = GaaStats.MAX_HP
	
		if GaaStats.STM < GaaStats.MAX_STM:
			GaaStats.STM = GaaStats.MAX_STM
	
	if not ENABLED:
		yield(get_tree().create_timer(0.5),"timeout")
		if not CUTSCENE:
			ENABLED = true
	
	almostdead.modulate = Color(0.24, 0, 0.08, 0)
	
	self.global_position = Global.player_initial_spawn_location
	
	stats()
	
	dmgarea.knockback_vector = velocity
	
	Global.connect("PARRY", self, "parried")
	Global.connect("NO_HIT", self, "no_hit")
	
	GaaStats.connect("LEVELUP", self, "levelup")


func _process(delta):
	stats()
	knockbacked(delta)
	block()
	
	$Reflection.frame = spr.frame
	$Reflection.flip_h = spr.flip_h
	$Reflection.offset = spr.offset
	
	if not CUTSCENE:
		if Input.is_action_pressed("ui_move_left"):
			spr.flip_h = true
		if Input.is_action_pressed("ui_move_right"):
			spr.flip_h = false
	
	if inputVector != Vector2(0, 0):
		dash_attack(delta)
	
	if Input.is_action_just_pressed("ui_reset"):
		get_tree().reload_current_scene()
		MidDialogue.text = Dialogue.placeholder_dialogue
		MidDialogue.tutorialpoints = 0
		MidDialogue.dialogue_index = -1
		MidDialogue.load_dialogue()
	
	if ENABLED and not MidDialogue.dialogbox.visible and not CUTSCENE:
		if not BLOCK:
			if DASH and ATTACK:
				if inputVector != Vector2.ZERO:
					dash(delta)
			
			dashing_stop()
			move(delta)
		
		if GaaStats.HAS_POWER and ATTACKING:
			transformation()
			attack()
			double_edge_transformation()
			summon_spears()
		
		if ATTACK:
			attack()
	
	if not ENABLED:
		cloudfx.emitting = false
	
	if STOP_ANIMATIONS:
		anim.stop()
		cloudfx.emitting = false
	
	if MidDialogue.dialogbox.visible:
		if not CUTSCENE:
			if not ATTACK:
				anim.play("Idle (Normal)")
			else:
				anim.play("Idle (Attack)")
			
			velocity = Vector2(0 ,0)
		
		if MidDialogue.trigger == "End":
			ENABLED = true
			CUTSCENE = false


func stats():
	hpbar.value = GaaStats.HP
	hpbar.max_value = GaaStats.MAX_HP
	
	stmbar.value = GaaStats.STM
	stmbar.max_value = GaaStats.MAX_STM
	
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
			transtween.start()
	
	if hpbar.value <= 25:
		if almostdead.modulate == Color(0.24, 0, 0.08, 0):
			deadtween.interpolate_property(almostdead, "modulate", Color(0.24, 0, 0.08, 0), Color(0.24, 0, 0.08, 0.6), 1, Tween.TRANS_QUAD, Tween.EASE_IN)
			deadtween.start()
		
		if Global.gaabattle.playing:
			Global.gaabattle.pitch_scale = 0.65
	
	elif hpbar.value > 25:
		if almostdead.modulate == Color(0.24, 0, 0.08, 0.6):
			deadtween.interpolate_property(almostdead, "modulate", Color(0.24, 0, 0.08, 0.6), Color(0.24, 0, 0.08, 0), 1, Tween.TRANS_QUAD, Tween.EASE_IN)
			deadtween.start()
		
		if theme.playing:
			theme.pitch_scale = 1
	
	if GaaStats.HP > GaaStats.MAX_HP:
		GaaStats.HP = GaaStats.MAX_HP
	
	if GaaStats.STM > GaaStats.MAX_STM - 0.05:
		GaaStats.STM = GaaStats.MAX_STM - 0.05
	
	if TRANSFORMATION:
		GaaStats.STM -= 0.05
	elif not TRANSFORMATION:
		GaaStats.STM += 0.05
	
	if ATTACK:
		SPEED = 350
	else:
		SPEED = 150


func move(fps):
	shadow.offset = spr.offset
	
	dashVelocity = inputVector
	
	inputVector.x = Input.get_action_strength("ui_move_right") - Input.get_action_strength("ui_move_left")
	inputVector.y = Input.get_action_strength("ui_move_down") - Input.get_action_strength("ui_move_up")
	
	velocity.x = move_toward(velocity.x, inputVector.x * SPEED, ACCELERATION * fps)
	velocity.y = move_toward(velocity.y, inputVector.y * SPEED, ACCELERATION * fps)
	
	if inputVector.x > 0:
		spr.flip_h = false
		beacon.rotation_degrees = 0
		dmgarea.rotation_degrees = 0
		cloudfx.rotation_degrees = 225
		cloudfx.position = Vector2(-8, 16)
		dmgarea.knockback_vector = inputVector
		cloudfx.gravity.y = 98
	
	if inputVector.x < 0:
		spr.flip_h = true
		beacon.rotation_degrees = -180
		dmgarea.rotation_degrees = -180
		cloudfx.rotation_degrees = 315
		cloudfx.position = Vector2(8, 16)
		dmgarea.knockback_vector = inputVector
		cloudfx.gravity.y = -98
	
	if joystickRight and joystickRight.is_pressed():
		rotation = joystickRight.get_output().angle()
	
	if velocity.x != 0 or velocity.y != 0:
		if not ATTACK:
			anim.play("Walk (Normal)")
		else:
			anim.play("Run (Attack)")
	
	elif velocity.x == 0 or velocity.y == 0:
		if not ATTACK:
			anim.play("Idle (Normal)")
		else:
			anim.play("Idle (Attack)")
	
	if not is_dash_attack:
		velocity = move_and_slide(velocity, UP)


func dash(fps):
	if Input.is_action_just_pressed("ui_dash"):
		var dashfx = dashcloud.instance()
		get_parent().add_child(dashfx)
		
		velocity = dashVelocity * 2500
		
		is_dashing = true
		
		$GhostTimer.start()
		
		if spr.flip_h:
			dashfx.rotation_degrees = 0
			dashfx.get_node("Sprite").rotation_degrees = 0
			dashfx.get_node("Sprite").flip_h = true
		else:
			dashfx.rotation_degrees = -180
			dashfx.get_node("Sprite").rotation_degrees = -180
			dashfx.get_node("Sprite").flip_h = false
		
		dashfx.global_position = self.global_position
		
		dashfx.emitting = true
		dashfx.one_shot = true
		
		dashfx.modulate = self.modulate
		
		dashfx.get_node("Sprite").texture = spr.texture
		dashfx.get_node("Sprite").hframes = spr.hframes
		dashfx.get_node("Sprite").vframes = spr.vframes
		dashfx.get_node("Sprite").frame = spr.frame
		dashfx.get_node("Tween").interpolate_property(dashfx.get_node("Sprite"), "modulate", Color(0, 0, 0, 1), Color(0, 0, 0, 0), 0.2, Tween.TRANS_QUAD, Tween.EASE_IN)
		dashfx.get_node("Tween").start()
		
		DASH = false
		INVINCIBLE = true
		
		$DashTimer.start()
		$InvincibilityTimer.start()
		
		$Teleport.play()
	
	dashVelocity = dashVelocity.move_toward(Vector2.ZERO, 200 * fps)
	dashVelocity = move_and_slide(dashVelocity)


func dash_attack(_fps):
	if ATTACKING:
		if Input.is_action_just_pressed("ui_attack"):
			if stmbar.value <= 25 and is_dashing:
				stmindi.shake(120, 0.5)
				stmindi.show()
				
				errorsfx.play()
		
		if Input.is_action_just_pressed("ui_attack"):
			if stmbar.value > 25 and ENABLED:
				if GaaStats.SCYTHE_LEVEL >= 0:
					if is_dashing:
						if spr.flip_h:
							dashVelocity = Vector2.LEFT
						else:
							dashVelocity = Vector2.RIGHT
						
						velocity = dashVelocity * 800
						
						anim.play("Dash Attack")
						
						is_dashing = false
						is_dash_attack = true
						
						GaaStats.STM -= 20
						
						ENABLED = false
						
						DASH = false
						INVINCIBLE = true
						
						$DashTimer.start()
						$InvincibilityTimer.start()
						
						$Teleport.play()
						
						for shadows in 4:
							var ghostframes = ghostfx.instance()
							get_parent().add_child(ghostframes)
							
							ghostframes.global_position = self.global_position
							
							ghostframes.texture = spr.texture
							ghostframes.hframes = spr.hframes
							ghostframes.vframes = spr.vframes
							ghostframes.frame = spr.frame
							ghostframes.flip_h = spr.flip_h
							yield(get_tree().create_timer(0.1), "timeout")
	
	if not CUTSCENE:
		velocity = move_and_slide(velocity, UP)
	else:
		velocity = Vector2.ZERO
		cloudfx.emitting = false


func dashing_stop():
	if is_dashing:
		spr.frame = 50
		
		yield(get_tree().create_timer(0.2),"timeout")
		
		is_dashing = false
		$GhostTimer.stop()


func attack():
	if Input.is_action_just_pressed("ui_tp_behind"):
		if GaaStats.SCYTHE_LEVEL >= 0:
			if ATTACK:
				if GaaStats.STM >= 25:
					velocity = Vector2(0, 0)
					ENABLED = false
					
					GaaStats.STM -= 25
					anim.play("Shoot")
				
				elif GaaStats.STM < 25:
					stmindi.shake(120, 0.5)
					stmindi.show()
					
					errorsfx.play()
	
	if Input.is_action_just_pressed("ui_attack"):
		if GaaStats.SCYTHE_LEVEL >= 0:
			if ATTACK:
				velocity = Vector2(0, 0)
				ENABLED = false
				combo += 0.5
				
				if combo == 1:
					anim.play("Attack")
				elif combo == 2:
					anim.play("Attack 2")
				elif combo == 3:
					anim.play("Attack 3")
				
				$AttackTimer.start()
	
	if Input.is_action_just_pressed("ui_sucker"):
		if GaaStats.SCYTHE_LEVEL >= 0:
			if ATTACK:
				velocity = Vector2(0, 0)
				ENABLED = false
				anim.play("Final Attack")


func summon_spears():
	if Input.is_action_just_pressed("ui_superkick"):
		if GaaStats.STM < 20:
			stmindi.shake(120, 0.5)
			stmindi.show()
			
			errorsfx.play()
		
		elif GaaStats.STM > 10:
			GaaStats.STM -= 15
		
			var amount_of_stuff = 3
			for amount in amount_of_stuff:
				var solid_spear = spears.instance()
				get_parent().add_child(solid_spear)
				
				if spr.flip_h:
					solid_spear.DIRECTION = "Left"
					solid_spear.global_position.y = self.global_position.y + rand_range(-32, 32)
					solid_spear.global_position.x = self.global_position.x + 64
				elif not spr.flip_h:
					solid_spear.DIRECTION = "Right"
					solid_spear.global_position.y = self.global_position.y - rand_range(32, -32)
					solid_spear.global_position.x = self.global_position.x - 64


func summon_big_slash():
	Global.camera.shake(220, 0.2)
	
	for amount in 1:
		var big_ass_slash = big_slash.instance()
		get_parent().get_parent().add_child(big_ass_slash)
		
		if spr.flip_h:
			big_ass_slash.DIRECTION = "Left"
			big_ass_slash.global_position.y = self.global_position.y
			big_ass_slash.global_position.x = self.global_position.x - 32
		elif not spr.flip_h:
			big_ass_slash.DIRECTION = "Right"
			big_ass_slash.global_position.y = self.global_position.y
			big_ass_slash.global_position.x = self.global_position.x + 32


func double_edge_transformation():
	if Input.is_action_just_pressed("ui_decked"):
		if ATTACK:
			if not TRANSFORMATION:
				if GaaStats.STM >= 25:
					anim.play("Double Edge Transformation")
					velocity = Vector2(0, 0)
					ENABLED = false
					
					GaaStats.STM -= 25
				elif GaaStats.STM < 25:
					stmindi.shake(120, 0.5)
					stmindi.show()
					
					errorsfx.play()
			else:
				TRANSFORMATION = false
				
				$GhostTimer.stop()
				
				transtween.interpolate_property(colorfx, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.3, Tween.TRANS_QUAD, Tween.EASE_IN)
				transtween.start()


func block():
	if ENABLED and not MidDialogue.dialogbox.visible and not CUTSCENE:
		if not hurt:
			if ATTACK:
				if is_dashing:
					if Input.is_action_pressed("ui_block"):
						velocity.x = lerp(velocity.x, 0, 0.05)
						spr.frame = 27
				
				if not is_dashing:
					if Input.is_action_pressed("ui_block"):
						if cloudfx.emitting:
							cloudfx.emitting = false
						
						velocity = Vector2(0, 0)
						spr.frame = 51
						BLOCK = true
						
						$Footstep.stop()
						anim.stop()
					
					if Input.is_action_just_pressed("ui_block"):
						PARRY = true
						yield(get_tree().create_timer(PARRYTIMER), "timeout")
						PARRY = false
	
	if not is_dashing:
		if Input.is_action_just_released("ui_block"):
			BLOCK = false
			PARRY = false


func parried():
	if stmbar.value < stmbar.max_value:
		stmbar.value += 10
	
	var shield = parryshield.instance()
	get_parent().add_child(shield)
	
	shield.global_position = self.global_position
	
	parrytween.interpolate_property(parryindi, "rect_scale", Vector2(1.2 , 1.2), Vector2(1 ,1), 0.4, Tween.TRANS_QUAD, Tween.EASE_IN)
	parrytween.start()
	
	parryindi.modulate = Color(1, 1, 1, 1)
	parryindi.text = str("AAAAAA!!!")
	
	yield(get_tree().create_timer(0.4),"timeout")
	parrytween.stop_all()
	
	parrytween.interpolate_property(parryindi, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
	parrytween.start()


func critical():
	$Critical.play()
	
	parrytween.interpolate_property(parryindi, "rect_scale", Vector2(1.2 , 1.2), Vector2(1 ,1), 0.4, Tween.TRANS_QUAD, Tween.EASE_IN)
	parrytween.start()
	
	parryindi.modulate = Color(1, 1, 1, 1)
	parryindi.text = str("O_O")
	
	yield(get_tree().create_timer(0.4),"timeout")
	parrytween.stop_all()
	
	parrytween.interpolate_property(parryindi, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
	parrytween.start()


func no_hit():
	if not GaaStats.DAMAGED and GaaStats.DEATHS == 0:
		nohitsign.play()
		$NoHit.play()


func shake():
	Global.camera.shake(100, 0.5)


func transformation():
	if Input.is_action_just_pressed("ui_transformation"):
		if ATTACK:
			anim.play("Untransform")
		else:
			anim.play("Transform")
		
		ATTACK = !ATTACK
		
		ENABLED = false
		velocity = Vector2.ZERO


func knockbacked(fps):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * fps)
	knockback = move_and_slide(knockback)


func _on_HPBar_value_changed(value):
	if hpbar.value <= hpbar.min_value:
		hurtsfx.pitch_scale = 0.6
		Engine.time_scale = 0.05
		
		$Camera.zoom = Vector2(0.5, 0.5)
		
		if BLOCK:
			get_tree().reload_current_scene()
	
	if hpbar.value < hpbar.max_value and hpbar.value >= hpbar.min_value:
		if ENABLED:
			GaaStats.DAMAGED = true
			
			if BLOCK and not STUNNED:
				if stmbar.value > 0:
					GaaStats.STM -= 25
					$Dush.play()
				
				if stmbar.value <= stmbar.min_value:
					BLOCK = false
					STUNNED = true
					$Ding.play()
			
			if not BLOCK:
				hurtsfx.play()
				
				hurt = true
				ENABLED = false
				is_dashing = false
				
				if ATTACK:
					anim.play("Hurt (Attack)")
				else:
					anim.play("Hurt (Normal)")
				
				var impactframe = impact.instance()
				get_parent().add_child(impactframe)
				
				impactframe.global_position = self.global_position
				
				Global.camera.shake(120, 0.2)
				
				var damageindicator = dmgindi.instance()
				self.add_child(damageindicator)
				
				if enemy != null:
					damageindicator.amount = enemy.DAMAGE
				else:
					damageindicator.amount = GaaStats.SCYTHE_STRENGTH
				
				damageindicator.position.y = -26
				
				Engine.time_scale = 0.1
				yield(get_tree().create_timer(0.05),"timeout")
				Engine.time_scale = 1


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Attack 3":
		combo = 0
	
	if anim_name == "Hurt (Attack)" or anim_name == "Hurt (Normal)":
		hurt = false
		ENABLED = true
		velocity = Vector2(0 ,0)
		knockback = Vector2(0 ,0)
		
		if hpbar.value <= hpbar.min_value:
			get_tree().reload_current_scene()
			
			GaaStats.HP = GaaStats.MAX_HP
			GaaStats.DEATHS += 1
			
			MidDialogue.text = Dialogue.placeholder_dialogue
			MidDialogue.tutorialpoints = 0
			MidDialogue.dialogue_index = -1
			MidDialogue.load_dialogue()


func _on_DamageArea_body_entered(body):
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
			shield.global_position = self.global_position - Vector2(2, 0)
		
		if not body.PARRY:
			body.HP -= GaaStats.SCYTHE_STRENGTH * MULTIPLIER
			
			if TRANSFORMATION:
				body.HP -= GaaStats.SCYTHE_STRENGTH * MULTIPLIER * 2
			
			if critical == 1:
				if not TRANSFORMATION:
					body.HP -= GaaStats.SCYTHE_STRENGTH * MULTIPLIER * 2
				else:
					body.HP -= GaaStats.SCYTHE_STRENGTH * MULTIPLIER * 4
				
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
			
			body.knockback = dmgarea.knockback_vector * 100


func _on_GhostTimer_timeout():
	var ghostframes = ghostfx.instance()
	get_parent().add_child(ghostframes)
	
	ghostframes.global_position = self.global_position
	
	ghostframes.texture = spr.texture
	ghostframes.hframes = spr.hframes
	ghostframes.vframes = spr.vframes
	ghostframes.frame = spr.frame
	ghostframes.flip_h = spr.flip_h


func _on_DashTimer_timeout():
	if not DASH:
		DASH = true
		$DashTimer.stop()


func _on_InvincibilityTimer_timeout():
	INVINCIBLE = false
	$InvincibilityTimer.stop()
	
	transtween.start()


func _on_AttackTimer_timeout():
	if combo > 0:
		combo = 0

