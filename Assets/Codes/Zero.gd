extends KinematicBody2D

var dmgindi = preload("res://Assets/Scenes/Misc/DamageIndicator.tscn")
var parryshield = preload("res://Assets/Scenes/Misc/ParryShield.tscn")
var impact = preload("res://Assets/Scenes/Misc/Impact.tscn")
var ghostfx = preload("res://Assets/Scenes/Misc/GhostFrames.tscn")
var explosiveknives = preload("res://Assets/Scenes/Attacks/Zero/ExplodingKnives.tscn")
var knives = preload("res://Assets/Scenes/Attacks/Zero/Knives.tscn")

var velocity = Vector2()
var knockback = Vector2.ZERO

export var UP = Vector2(0, -1)

export var HP = 200
export var MAX_HP = 200

export var STM = 100
export var MAX_STM = 100

export var DAMAGE = 10

export var ACCELERATION = 10000
export var SPEED = 100

export var CUTSCENE = false
export var ENABLED = true
export var PARRY = true
export var TIRED = false
export var BOUNCE = false

export var EXP = 1000
export var CASH = 800
export var MAXCASH = 1000

onready var shakeTimer = $ShakeTimer
onready var tween = $Tween

onready var spr = $Sprite
onready var anim = $Animation
onready var dmgarea = $DamageArea
onready var noticearea = $NoticeArea
onready var shadow = $Shadow

onready var hpbar = $HPBar
onready var stmbar = $STMBar

onready var softcollision = $SoftCollision
onready var spawnleft = $SpawnArea/TopLeft
onready var spawnright = $SpawnArea/BottomRight

onready var hurtsfx = $Hurt

var player = null
var attack = 0
var final_phase = false
var finale = false

var shake_amount = 0
var default_offset = Vector2(288, 150)


func _ready():
	HP = MAX_HP
	
	OS.window_borderless = false
	OS.window_position.x = 288
	OS.window_position.y = 150
	
	$Timer.stop()


func _process(delta):
	stats()
	knockbacked(delta)
	
	OS.window_position = Vector2(rand_range(-shake_amount, shake_amount), rand_range(shake_amount, -shake_amount)) * delta + default_offset
	
	if PlayerStats.HP <= 0 and HP <= 50:
		if not PlayerStats.SOCLOSE:
			PlayerStats.SOCLOSE = true
			Global.emit_signal("ACHIEVEMENT")
			Global.achieveddesc.text = "'i'm sorry for your lost lmao'"
			Global.achievedtitle.text = "SO CLOSE!!"
			Global.achievedsprite.frame = 10
			Global.achievedsprite.show()
			
			PlayerStats.save_game()
	
	if BOUNCE:
		bounce(delta)
	
	if CUTSCENE:
		anim.stop()
	
	if ENABLED and not TIRED and not MidDialogue.dialogbox.visible:
		move(delta)
	
	if not CUTSCENE:
		if player != null and ENABLED and not TIRED and not MidDialogue.dialogbox.visible:
			accelerate_toward_point(player.global_position, delta)


func move(fps):
	shadow.offset = spr.offset
	
	if velocity.x > 0:
		spr.flip_h = true
		dmgarea.rotation_degrees = 0
		dmgarea.knockback_vector = velocity
		noticearea.rotation_degrees = 0
	
	if velocity.x < 0:
		spr.flip_h = false
		dmgarea.rotation_degrees = -180
		dmgarea.knockback_vector = velocity
		noticearea.rotation_degrees = -180
	
	if velocity.x != 0 or velocity.y != 0:
		if HP > 50:
			anim.play("Run")
		elif HP <= 50:
			anim.play("Run Phase 2")
	
	elif velocity.x == 0 or velocity.y == 0:
		if HP > 50:
			anim.play("Idle")
		elif HP <= 50:
			anim.play("Idle Phase 2")
	
	if softcollision.is_colliding():
		velocity += softcollision.get_push_vector() * fps * 1000
	
	velocity = move_and_slide(velocity, UP)


func bounce(fps):
	velocity.x += 1
	velocity.y += 1
	
	var collision_info = move_and_collide(velocity * 0.05)
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)


func knockbacked(fps):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * fps)
	knockback = move_and_slide(knockback)


func summon_explosives():
	var explosives = explosiveknives.instance()
	get_parent().add_child(explosives)
	
	explosives.global_position.x = floor(rand_range(spawnleft.global_position.x, spawnright.global_position.x))
	explosives.global_position.y = floor(rand_range(spawnleft.global_position.y, spawnright.global_position.y))


func summon_knives():
	var knife = knives.instance()
	get_parent().add_child(knife)
	
	knife.global_position = spr.global_position + spr.offset


func teleport():
	if player != null:
		if player.spr.flip_h:
			spr.flip_h = false
			dmgarea.rotation_degrees = -180
			dmgarea.knockback_vector = Vector2.RIGHT
			
			self.position.x = player.global_position.x + 16
			self.position.y = player.global_position.y
		else:
			spr.flip_h = true
			dmgarea.rotation_degrees = 0
			dmgarea.knockback_vector = Vector2.LEFT
			
			self.position.x = player.global_position.x - 16
			self.position.y = player.global_position.y


func start_timer():
	$Timer.start()


func stats():
	hpbar.value = HP
	hpbar.max_value = MAX_HP
	
	stmbar.value = STM
	stmbar.max_value = MAX_STM


func shake():
	Global.camera.shake(120, 0.2)


func screenshake(new_shake, shake_time = 0.2, shake_limit = 9999):
	if GlobalSettings.screenshake:
		shake_amount = 0
		shake_amount += new_shake
		if shake_amount > shake_limit:
			shake_amount = shake_limit
			
		shakeTimer.wait_time = shake_time
		
		tween.stop_all()
		shakeTimer.start()


func full_health():
	if HP <= 50 and not final_phase:
		MAX_HP = 50
		HP = MAX_HP
		
		STM = MAX_STM
		attack = 0
		
		PlayerStats.HP += 50
		
		OS.window_fullscreen = false
		OS.window_borderless = true
		screenshake(200, INF)
	
	if HP <= 1 and final_phase:
		MAX_HP = 1
		HP = MAX_HP
		
		$OutsideAnimation.play("Final")
		$AltBGMusic.stop()
		$FinalBGMusic.play()
		
		anim.playback_speed = 0.5
		SPEED = 20
		
		OS.window_borderless = false
		screenshake(200, 0)


func accelerate_toward_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity.x = max(direction.x-ACCELERATION, SPEED * direction.x)
	velocity.y = min(direction.y+ACCELERATION, SPEED * direction.y)


func _on_DamageArea_body_entered(body):
	if body.is_in_group("Player") and HP > 0:
		if not player.PARRY and not player.BLOCK and not player.INVINCIBLE:
			if spr.flip_h:
				player.spr.flip_h = true
				player.knockback = Vector2.RIGHT * 200
			else:
				player.spr.flip_h = false
				player.knockback = Vector2.LEFT * 200
			
			if GlobalSettings.difficulty != 0:
				player.ENABLED = true
				PlayerStats.HP -= DAMAGE
				GaaStats.HP -= DAMAGE
				SackStats.HP -= DAMAGE
			if GlobalSettings.difficulty == 2:
				player.ENABLED = true
				PlayerStats.HP -= DAMAGE * 2
				GaaStats.HP -= DAMAGE * 2
				SackStats.HP -= DAMAGE * 2
		
		if player.PARRY:
			if spr.flip_h:
				player.spr.flip_h = true
				player.knockback = Vector2.RIGHT * 50
				knockback = Vector2.LEFT * 100
			else:
				player.spr.flip_h = false
				player.knockback = Vector2.LEFT * 50
				knockback = Vector2.RIGHT * 100
			
			HP -= PlayerStats.LEG_STRENGTH * 0.2
			HP -= GaaStats.SCYTHE_STRENGTH * 0.2
			HP -= SackStats.STAFF_STRENGTH * 0.2
			Global.emit_signal("PARRY")
		
			$Timer.start()
		
		if player.BLOCK and not player.PARRY and player.ENABLED:
			if spr.flip_h:
				player.spr.flip_h = true
				player.knockback = Vector2.RIGHT * 50
			else:
				player.spr.flip_h = false
				player.knockback = Vector2.LEFT * 50
			
			if GlobalSettings.difficulty != 0:
				PlayerStats.HP -= 5
				GaaStats.HP -= 5
				SackStats.HP -= 5


func _on_NoticeArea_body_entered(body):
	if body.is_in_group("Player"):
		if ENABLED and not TIRED and not CUTSCENE:
			ENABLED = false
			anim.play("Attack 0 - Instant Kill")


func _on_PlayerFinder_body_entered(body):
	if body.is_in_group("Player"):
		if player == null:
			player = body


func _on_HPBar_value_changed(value):
	if hpbar.value < hpbar.max_value and hpbar.value >= hpbar.min_value:
		if STM <= 0:
			STM = MAX_STM
			TIRED = false
			PARRY = true
		
		if not finale:
			ENABLED = false
			BOUNCE = false
			
			Global.camera.shake(90, 0.2)
			
			var impactframe = impact.instance()
			get_parent().add_child(impactframe)
			
			impactframe.global_position = self.global_position
			
			var damageindicator = dmgindi.instance()
			self.add_child(damageindicator)
			
			if player.PARRY:
				damageindicator.amount = PlayerStats.LEG_STRENGTH - 10
			else:
				damageindicator.amount = PlayerStats.LEG_STRENGTH
			
			damageindicator.position.y = -32
			
			
			hurtsfx.play()
			anim.play("Hurt")
	
	
	if hpbar.value <= hpbar.min_value and final_phase:
		ENABLED = false
		
		Global.camera.shake(90, 0.2)
		
		if GlobalSettings.difficulty != 0 and final_phase:
			Global.emit_signal("NO_HIT")
			
			PlayerStats.EXP += EXP * GlobalSettings.difficulty
			PlayerStats.CASH += floor(rand_range(CASH, MAXCASH)) * GlobalSettings.difficulty
			PlayerStats.BEAT_ZERO = true
			PlayerStats.save_game()
			
			if finale:
				$OutsideAnimation.play("Death")
				$FinalBGMusic.stop()
		
		if final_phase:
			$AltBGMusic.stop()
		
		var impactframe = impact.instance()
		get_parent().add_child(impactframe)
		
		impactframe.global_position = self.global_position
		
		var damageindicator = dmgindi.instance()
		self.add_child(damageindicator)
		
		if player.PARRY:
			damageindicator.amount = PlayerStats.LEG_STRENGTH - 10
		else:
			damageindicator.amount = PlayerStats.LEG_STRENGTH
		
		damageindicator.position.y = -32
		
		hurtsfx.play()
		
		if not finale:
			anim.play("Hurt")


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Attack 1 - Slasher Danger" or anim_name == "Attack 2 - Slasher Blasher" or anim_name == "Attack 4 - Special Strike" or anim_name == "Attack 3 - Knives":
		$Timer.start()
		ENABLED = true
		
		if STM <= 0:
			anim.play("Tired")
			TIRED = true
			
			PARRY = false
	
	
	if anim_name == "Attack 5 - Whirlwind" or anim_name == "Attack 6 - Killer Spree" or anim_name == "Attack 7 - Sike" or anim_name == "Attack 8 - Genocidal Intent":
		$Timer.start()
		ENABLED = true
		
		if STM <= 0:
			anim.play("Tired")
			TIRED = true
			
			PARRY = false
	
	
	if anim_name == "Alt Attack 1 - Killer Spree" or anim_name == "Alt Attack 2 - Knives" or anim_name == "Alt Attack 3 - Soul" or anim_name == "Alt Attack 4 - Genocidal Intent":
		$Timer.start()
		ENABLED = true
		
		if STM <= 0:
			anim.play("Alt Tired")
			TIRED = true
			
			PARRY = false
	
	
	if anim_name == "Hurt":
		if HP <= 1:
			if final_phase:
				full_health()
				
				anim.play("Defeat")
				
				ENABLED = true
				TIRED = true
				PARRY = false
				finale = true
				
				stmbar.hide()
		
		if HP <= 50 and $BGMusic.playing:
			$OutsideAnimation.play("Cut")
			$BGMusic.stop()
			
			anim.playback_speed = 1
			SPEED = 250
		
		$Timer.start()
		ENABLED = true
	
	
	if anim_name == "Attack 0 - Instant Kill" or anim_name == "Alt Attack 0 - Instant Kill":
		attack += 1
		
		if HP > 100:
			STM -= 25
			if attack == 1:
				anim.play("Attack 1 - Slasher Danger")
			if attack == 2:
				anim.play("Attack 2 - Slasher Blasher")
			if attack == 3:
				anim.play("Attack 3 - Knives")
			if attack >= 4:
				anim.play("Attack 4 - Special Strike")
				attack = 0
		
		if HP <= 100 and HP > 50:
			STM -= 25
			if attack == 1:
				anim.play("Attack 5 - Whirlwind")
			if attack == 2:
				anim.play("Attack 6 - Killer Spree")
			if attack == 3:
				anim.play("Attack 7 - Sike")
			if attack >= 4:
				anim.play("Attack 8 - Genocidal Intent")
				attack = 0
		
		if HP <= 50 and HP > 1:
			STM -= 12.5
			final_phase = true
			if attack == 1:
				anim.play("Alt Attack 1 - Killer Spree")
			if attack == 2:
				anim.play("Alt Attack 2 - Knives")
			if attack == 3:
				anim.play("Alt Attack 3 - Soul")
			if attack >= 4:
				anim.play("Alt Attack 4 - Genocidal Intent")
				attack = 0
		
		ENABLED = false
		$Timer.stop()


func _on_Timer_timeout():
	if ENABLED and not TIRED and not CUTSCENE:
		attack += 1
		
		if HP > 100:
			STM -= 25
			if attack == 1:
				anim.play("Attack 1 - Slasher Danger")
			if attack == 2:
				anim.play("Attack 2 - Slasher Blasher")
			if attack == 3:
				anim.play("Attack 3 - Knives")
			if attack >= 4:
				anim.play("Attack 4 - Special Strike")
				attack = 0
		
		if HP <= 100 and HP > 50:
			STM -= 25
			if attack == 1:
				anim.play("Attack 5 - Whirlwind")
			if attack == 2:
				anim.play("Attack 6 - Killer Spree")
			if attack == 3:
				anim.play("Attack 7 - Sike")
			if attack >= 4:
				anim.play("Attack 8 - Genocidal Intent")
				attack = 0
		
		if HP <= 50 and HP > 0:
			STM -= 12.5
			final_phase = true
			if attack == 1:
				anim.play("Alt Attack 1 - Killer Spree")
			if attack == 2:
				anim.play("Alt Attack 2 - Knives")
			if attack == 3:
				anim.play("Alt Attack 3 - Soul")
			if attack >= 4:
				anim.play("Alt Attack 4 - Genocidal Intent")
				attack = 0
		
		ENABLED = false
		$Timer.stop()


func _on_ShakeTimer_timeout():
	shake_amount = 0
	
	tween.interpolate_property(OS, "window_position", OS.window_position, default_offset, 0.1, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.start()

