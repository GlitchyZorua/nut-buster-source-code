extends KinematicBody2D

var dmgindi = preload("res://Assets/Scenes/Misc/DamageIndicator.tscn")
var dashcloud = preload("res://Assets/Scenes/Misc/DashClouds.tscn")
var parryshield = preload("res://Assets/Scenes/Misc/ParryShield.tscn")
var impact = preload("res://Assets/Scenes/Misc/Impact.tscn")
var ghostfx = preload("res://Assets/Scenes/Misc/GhostFrames.tscn")

var arrow = preload("res://Assets/Scenes/Attacks/Sack/SackArrows.tscn")
var bigarrow = preload("res://Assets/Scenes/Attacks/Sack/SackBigArrows.tscn")
var strings = preload("res://Assets/Scenes/Attacks/Sack/SackWebstringAttack.tscn")

var openmenu = false

var velocity = Vector2()
var inputVector = Vector2()
var knockback = Vector2.ZERO
var dashVelocity = Vector2.ZERO

export var UP = Vector2(0, -1)

export var ACCELERATION = 10000
export var SPEED = 100
export var MULTIPLIER = 1
export var PARRYTIMER = 0.15

export var STOP_ANIMATIONS = false
export var CUTSCENE = false
export var ENABLED = true
export var PARRY = false
export var STUNNED = false
export var BLOCK = false
export var TRANSFORMATION = false
export var ATTACK = false
export var ATTACKING = true
export var DASH = true
export var INVINCIBLE = false

onready var spr = $Sprite
onready var anim = $Animation
onready var dmgarea = $DamageArea
onready var hpbar = $HPBar
onready var stmbar = $STMBar
onready var shadow = $Shadow
onready var camera = $Camera

onready var bgmusic = $BGMusic
onready var hurtsfx = $Hurt
onready var errorsfx = $Error

onready var parryindi = $Misc/ParryIndicator
onready var parrytween = $Misc/Tween
onready var targettext = $Misc/Target
onready var nohitsign = $Misc/Sign
onready var transtween = $Sprite/TransTween
onready var stmindi = $Misc/StaminaIndicator

var hurt = false
var is_dashing = false
export var is_packaging_sabathons = false

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
	Global.gaa = false
	Global.sack = true
	
	ENABLED = false
	Engine.time_scale = 1
	
	if SackStats.HP <= 0:
		SackStats.HP = SackStats.MAX_HP
	
	if not ENABLED:
		yield(get_tree().create_timer(0.5),"timeout")
		if not CUTSCENE:
			ENABLED = true
	
	Global.connect("PARRY", self, "parried")
	Global.connect("NO_HIT", self, "no_hit")
	
	SackStats.connect("LEVELUP", self, "levelup")


func _process(delta):
	stats()
	knockbacked(delta)
	combos()
	
	if SackStats.STM < SackStats.MAX_STM:
		SackStats.STM += 0.05
	
	if ATTACK:
		block()
	
	if not CUTSCENE and not MidDialogue.dialogbox.visible:
		transformationing()
		
		if Input.is_action_pressed("ui_move_left"):
			if not ATTACK:
				spr.flip_h = false
			else:
				spr.flip_h = true
			
			dmgarea.rotation_degrees = 0
			dmgarea.knockback_vector = inputVector
		if Input.is_action_pressed("ui_move_right"):
			if not ATTACK:
				spr.flip_h = true
			else:
				spr.flip_h = false
			
			dmgarea.rotation_degrees = -180
			dmgarea.knockback_vector = inputVector
	
	if STOP_ANIMATIONS:
		anim.stop()
	
	if Input.is_action_just_pressed("ui_reset"):
		get_tree().reload_current_scene()
		get_tree().paused = false
		MidDialogue.text = Dialogue.placeholder_dialogue
		MidDialogue.tutorialpoints = 0
		MidDialogue.dialogue_index = -1
		MidDialogue.load_dialogue()
	
	
	if ENABLED and not CUTSCENE and not MidDialogue.dialogbox.visible:
		if not BLOCK:
			dashing_stop()
			move(delta)
			
			if ATTACK:
				attack()
				tp_close()
			
			if not BLOCK:
				if DASH and ATTACK:
					dash(delta)
	
	if MidDialogue.dialogbox.visible:
		if not CUTSCENE:
			if not ATTACK:
				anim.play("Idle")
			else:
				anim.play("Idle & Staff")
			
			velocity = Vector2(0 ,0)
		
		if MidDialogue.trigger == "End":
			ENABLED = true
			CUTSCENE = false


func move(fps):
	shadow.offset = spr.offset
	
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputVector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity.x = move_toward(velocity.x, inputVector.x * SPEED, ACCELERATION * fps)
	velocity.y = move_toward(velocity.y, inputVector.y * SPEED, ACCELERATION * fps)
	
	if joystickRight and joystickRight.is_pressed():
		rotation = joystickRight.get_output().angle()
	
	if velocity.x != 0 or velocity.y != 0:
		if ATTACK:
			anim.play("Walk & Staff")
		else:
			anim.play("Walk")
	
	elif velocity.x == 0 or velocity.y == 0:
		if ATTACK:
			anim.play("Idle & Staff")
		else:
			anim.play("Idle")
	
	velocity = move_and_slide(velocity, UP)


func dash(fps):
	if Input.is_action_just_pressed("ui_dash"):
		var dashfx = dashcloud.instance()
		get_parent().add_child(dashfx)
		
		is_dashing = true
		
		if spr.flip_h:
			velocity = Vector2.LEFT * 1500
			dashfx.rotation_degrees = 0
			dashfx.get_node("Sprite").rotation_degrees = 0
			dashfx.get_node("Sprite").flip_h = true
		else:
			velocity = Vector2.RIGHT * 1500
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


func dashing_stop():
	if is_dashing:
		spr.frame = 63
		yield(get_tree().create_timer(0.3),"timeout")
		is_dashing = false


func stats():
	hpbar.value = SackStats.HP
	hpbar.max_value = SackStats.MAX_HP
	
	stmbar.value = SackStats.STM
	stmbar.max_value = SackStats.MAX_STM
	
	if SackStats.HP <= 0:
		SackStats.STM = SackStats.MAX_STM
	
	if SackStats.HP > SackStats.MAX_HP:
		SackStats.HP = SackStats.MAX_HP
	
	if SackStats.STM > SackStats.MAX_STM:
		SackStats.STM = SackStats.MAX_STM
	
	if ATTACK:
		SPEED = 200
	else:
		SPEED = 100
	
	if stmbar.value < stmbar.max_value:
		stmbar.visible = true
	else:
		stmbar.visible = false
	
	if hpbar.value < hpbar.max_value:
		hpbar.visible = true
	else:
		hpbar.visible = false
	
	if enemy_teleport != null:
		if enemy_teleport.HP > 0:
			targettext.text = str("Target: ", enemy_teleport.name)
		
		if enemy_teleport.HP <= 0:
			enemy_teleport = null
			targettext.text = str("")
	else:
		targettext.text = str("")


func summon_arrows():
	var amount_of_stuff = 6
	
	if combo != 1:
		for amount in amount_of_stuff:
			yield(get_tree().create_timer(0.05), "timeout")
			var arrows = arrow.instance()
			get_parent().add_child(arrows)
	
			if spr.flip_h:
				arrows.DIRECTION = "Left"
				arrows.global_position.y = self.global_position.y + rand_range(-32, 32)
				arrows.global_position.x = self.global_position.x + rand_range(64, 128)
			elif not spr.flip_h:
				arrows.DIRECTION = "Right"
				arrows.global_position.y = self.global_position.y - rand_range(32, -32)
				arrows.global_position.x = self.global_position.x - rand_range(64, 128)
	
	if combo == 1:
		anim.play("Alt Attack 1")
		
		var string = strings.instance()
		get_parent().get_parent().add_child(string)
		
		if enemy_teleport != null:
			string.global_position = enemy_teleport.global_position
		else:
			if spr.flip_h:
				string.global_position = self.global_position - Vector2(86, 0)
			else:
				string.global_position = self.global_position + Vector2(86, 0)


func summon_big_arrows():
	var arrows = bigarrow.instance()
	get_parent().get_parent().add_child(arrows)
	
	if spr.flip_h:
		arrows.DIRECTION = "Left"
		arrows.global_position.y = self.global_position.y
		arrows.global_position.x = self.global_position.x + 186
	elif not spr.flip_h:
		arrows.DIRECTION = "Right"
		arrows.global_position.y = self.global_position.y
		arrows.global_position.x = self.global_position.x - 186


func attack():
	if Input.is_action_just_pressed("ui_attack"):
		velocity = Vector2(0, 0)
		
		anim.play("Attack 0")
		ENABLED = false
	
	if Input.is_action_just_pressed("ui_superkick"):
		is_packaging_sabathons = true
		velocity = Vector2(0, 0)
		
		SackStats.STM -= 20
		
		anim.play("Attack 1")
		ENABLED = false
		
		if SackStats.STM < 25:
			stmindi.shake(120, 0.5)
			stmindi.show()
			
			errorsfx.play()
	
	if Input.is_action_just_pressed("ui_decked"):
		is_packaging_sabathons = true
		velocity = Vector2(0, 0)
		
		SackStats.STM -= 20
		
		anim.play("Attack 2")
		ENABLED = false
		
		if SackStats.STM < 25:
			stmindi.shake(120, 0.5)
			stmindi.show()
			
			errorsfx.play()


func combos():
	if Input.is_action_just_pressed("ui_down"):
		if is_packaging_sabathons:
			SackStats.STM -= 5
			
			combo = 1
			
			var sprite = Sprite.new()
			var tweener = Tween.new()
			
			get_parent().add_child(sprite)
			get_parent().add_child(tweener)
			
			sprite.texture = spr.texture
			sprite.hframes = spr.hframes
			sprite.vframes = spr.vframes
			sprite.flip_h = spr.flip_h
			sprite.frame = spr.frame
			sprite.global_position = self.global_position
			
			tweener.interpolate_property(sprite, "scale", Vector2(1, 1), Vector2(2, 2), 0.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
			tweener.interpolate_property(sprite, "modulate", Color(0.85, 0, 1, 1), Color(0.85, 0, 1, 0), 0.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
			tweener.start()
			
			
			if not tweener.is_active():
				sprite.queue_free()
				tweener.queue_free()


func block():
	if ENABLED and not MidDialogue.dialogbox.visible and not CUTSCENE:
		if not hurt:
			if ATTACK:
				if is_dashing:
					if Input.is_action_pressed("ui_block"):
						velocity.x = lerp(velocity.x, 0, 0.05)
						spr.frame = 63
				
				if not is_dashing:
					if Input.is_action_pressed("ui_block"):
						velocity = Vector2(0, 0)
						spr.frame = 62
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


func tp_close():
	if SackStats.STAFF_LEVEL >= 0:
		if Input.is_action_just_pressed("ui_tp_behind"):
			if enemy_teleport != null:
				$Misc/Blackout/BlackAnim.play("Blackout")
				
				if spr.flip_h:
					enemy_teleport.global_position.x = self.global_position.x - 64
					enemy_teleport.global_position.y = self.global_position.y
				else:
					enemy_teleport.global_position.x = self.global_position.x + 64
					enemy_teleport.global_position.y = self.global_position.y


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


func knockbacked(fps):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * fps)
	knockback = move_and_slide(knockback)


func levelup():
	anim.play("LevelUp")
	ENABLED = false


func transformationing():
	if Input.is_action_just_pressed("ui_transformation"):
		ENABLED = false
		ATTACK =! ATTACK
		bgmusic.playing =! bgmusic.playing
		
		if ATTACK:
			anim.play("Staff Pull Out")
		else:
			anim.play("Staff Pull Back")


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
					SackStats.STM -= 25
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
					damageindicator.amount = SackStats.STAFF_STRENGTH
				
				damageindicator.position.y = -26
				
				Engine.time_scale = 0.1
				yield(get_tree().create_timer(0.05),"timeout")
				Engine.time_scale = 1


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
			body.HP -= SackStats.STAFF_STRENGTH * MULTIPLIER
			
			if TRANSFORMATION:
				body.HP -= SackStats.STAFF_STRENGTH * MULTIPLIER * 2
			
			if critical == 1:
				if not TRANSFORMATION:
					body.HP -= SackStats.STAFF_STRENGTH * MULTIPLIER * 2
				else:
					body.HP -= SackStats.STAFF_STRENGTH * MULTIPLIER * 4
				
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


func _on_TeleportArea_body_entered(body):
	if body.is_in_group("Enemy"):
		enemy_teleport = body


func _on_TeleportArea_body_exited(body):
	if body.is_in_group("Enemy"):
		enemy_teleport = null


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Alt Attack 1" or anim_name == "Attack 1" or anim_name == "Attack 2":
		is_packaging_sabathons = false
		combo = 0
		
		if SackStats.STM <= 0:
			SackStats.HP -= 25
			
			stmindi.shake(120, 0.5)
			stmindi.show()
			
			errorsfx.play()
			
			anim.play("Hurt")
	
	if anim_name == "Staff Pull Out":
		if SackStats.SECTION == 0:
			if MidDialogue.tutorialpoints == 0:
				MidDialogue.tutorial(1)
	
	if anim_name == "Hurt":
		hurt = false
		ENABLED = true
		STUNNED = false
		velocity = Vector2(0 ,0)
		knockback = Vector2(0 ,0)
		
		if hpbar.value <= hpbar.min_value:
			get_tree().reload_current_scene()
			
			SackStats.HP = SackStats.MAX_HP
			SackStats.DEATHS += 1
			
			MidDialogue.text = Dialogue.placeholder_dialogue
			MidDialogue.tutorialpoints = 0
			MidDialogue.dialogue_index = -1
			MidDialogue.load_dialogue()


func _on_DashTimer_timeout():
	if not DASH:
		DASH = true
		$DashTimer.stop()


func _on_InvincibilityTimer_timeout():
	INVINCIBLE = false
	$InvincibilityTimer.stop()

