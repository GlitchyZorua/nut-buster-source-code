extends KinematicBody2D

var dmgindi = preload("res://Assets/Scenes/Misc/DamageIndicator.tscn")
var parryshield = preload("res://Assets/Scenes/Misc/ParryShield.tscn")
var dashcloud = preload("res://Assets/Scenes/Misc/DashClouds.tscn")
var impact = preload("res://Assets/Scenes/Misc/Impact.tscn")
var ghostfx = preload("res://Assets/Scenes/Misc/GhostFrames.tscn")

var velocity = Vector2()
var knockback = Vector2.ZERO

export var UP = Vector2(0, -1)

export var HP = 250
export var MAX_HP = 250

export var STM = 100
export var MAX_STM = 100

export var DAMAGE = 10

export var ACCELERATION = 10000
export var SPEED = 100

export var CUTSCENE = false
export var ENABLED = true
export var PARRY = false
export var INVINCIBLE = false

onready var spr = $Sprite
onready var anim = $Animation
onready var dmgarea = $DamageArea
onready var noticearea = $NoticeArea
onready var shadow = $Shadow

onready var hpbar = $HPLayer/HPBar
onready var hpcounter = $HPLayer/HPBar/Title
onready var stmbar = $HPLayer/STMBar
onready var stmcounter = $HPLayer/STMBar/Title

onready var softcollision = $SoftCollision

onready var hurtsfx = $Hurt

var player = null
var parry = 0
var attack = 0

var ENEMIES = 0
var ENEMIESTAKENDOWN = 3


func _ready():
	HP = MAX_HP
	
	ENABLED = false
	
	Global.connect("ENEMY_DEATH", self, "deaths")
	
	if not ENABLED:
		yield(get_tree().create_timer(0.5),"timeout")
		if not CUTSCENE:
			ENABLED = true


func _process(delta):
	stats()
	knockbacked(delta)
	
	if PlayerStats.HP <= 0 and HP <= 25:
		if not PlayerStats.SOCLOSE:
			PlayerStats.SOCLOSE = true
			Global.emit_signal("ACHIEVEMENT")
			Global.achieveddesc.text = "'i'm sorry for your lost lmao'"
			Global.achievedtitle.text = "SO CLOSE!!"
			Global.achievedsprite.frame = 10
			Global.achievedsprite.show()
			
			PlayerStats.save_game()
	
	if ENABLED:
		parry()
	if not ENABLED:
		PARRY = true
	
	if ENABLED and not MidDialogue.dialogbox.visible:
		move(delta)
	
	if not CUTSCENE:
		if player != null and ENABLED and not MidDialogue.dialogbox.visible:
			accelerate_toward_point(player.global_position, delta)


func accelerate_toward_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity.x = max(direction.x-ACCELERATION, SPEED * direction.x)
	velocity.y = min(direction.y+ACCELERATION, SPEED * direction.y)


func knockbacked(fps):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * fps)
	knockback = move_and_slide(knockback)


func deaths():
	if ENEMIES < ENEMIESTAKENDOWN:
		ENEMIES += 1
	
	if HP <= 0:
		if ENEMIES >= ENEMIESTAKENDOWN:
			MidDialogue.text = Dialogue.dialogue_2
			MidDialogue.dialogue_index = 22
			MidDialogue.load_dialogue()
		
		anim.play("Defeat")
		
		ENABLED = false
		$Timer.stop()


func stats():
	hpbar.value = HP
	hpbar.max_value = MAX_HP
	
	stmbar.value = STM
	stmbar.max_value = MAX_STM
	
	if HP < hpbar.min_value:
		HP = hpbar.min_value
	
	if HP <= 60:
		stmbar.show()
	
	hpcounter.text = str("Sack's HP: ", HP, " / ", MAX_HP)
	stmcounter.text = str("Sack's Stamina: ", STM, " / ", MAX_STM)
	
	$HPLayer/Guide.text = "!!! TIRE HIM OUT !!!"


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
		anim.play("Walk")
	
	elif velocity.x == 0 or velocity.y == 0:
		anim.play("Idle")
	
	if softcollision.is_colliding():
		velocity += softcollision.get_push_vector() * fps * 1000
	
	velocity = move_and_slide(velocity, UP)


func parry():
	if HP >= 200:
		parry = floor(rand_range(0, 101))
	if HP <= 150:
		parry = floor(rand_range(0, 4))
	if HP <= 100:
		parry = floor(rand_range(0, 2))
	if HP <= 60:
		parry = 0
		
	
	if parry == 0:
		PARRY = true
	else:
		PARRY = false


func teleport():
	if player != null:
		if player.spr.flip_h:
			self.position.x = player.global_position.x + 16
			self.position.y = player.global_position.y
		else:
			self.position.x = player.global_position.x - 16
			self.position.y = player.global_position.y
	
	var dashfx = dashcloud.instance()
	get_parent().add_child(dashfx)
	
	dashfx.get_node("Sprite").queue_free()
	
	if player != null:
		if player.spr.flip_h:
			spr.flip_h = false
			dmgarea.rotation_degrees = -180
			dmgarea.knockback_vector = Vector2.RIGHT
			noticearea.rotation_degrees = -180
		else:
			spr.flip_h = true
			dmgarea.rotation_degrees = 0
			dmgarea.knockback_vector = Vector2.LEFT
			noticearea.rotation_degrees = 0
	
	if spr.flip_h:
		dashfx.rotation_degrees = -180
	else:
		dashfx.rotation_degrees = 0
	
	dashfx.global_position = self.global_position
	
	dashfx.emitting = true
	dashfx.one_shot = true
	dashfx.modulate = self.modulate
	
	$Teleport.play()


func _on_DamageArea_body_entered(body):
	if body.is_in_group("Player") and HP > 0:
		if player.ENABLED and not player.PARRY and not player.BLOCK and not player.INVINCIBLE:
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
			Global.emit_signal("PARRY")
		
			$Timer.start()
		
		if player.TRANSFORMATION:
			if spr.flip_h:
				spr.flip_h = false
				player.spr.flip_h = true
				player.knockback = Vector2.RIGHT * 100
				knockback = Vector2.LEFT * 100
			else:
				spr.flip_h = true
				player.spr.flip_h = false
				player.knockback = Vector2.LEFT * 100
				knockback = Vector2.RIGHT * 100
			
			HP -= PlayerStats.LEG_STRENGTH - 5
			
			$Timer.start()
		
		if player.BLOCK and not player.PARRY and player.ENABLED:
			if spr.flip_h:
				player.spr.flip_h = true
				player.knockback = Vector2.RIGHT * 50
			else:
				player.spr.flip_h = false
				player.knockback = Vector2.LEFT * 50
			
			if GlobalSettings.difficulty != 0:
				PlayerStats.HP -= 2


func _on_NoticeArea_body_entered(body):
	if body.is_in_group("Player"):
		if ENABLED:
			if HP > 125:
				attack = floor(rand_range(0, 2))
			if HP <= 125:
				attack = floor(rand_range(0, 4))
			if HP <= 60:
				if STM > 25:
					attack = floor(rand_range(2, 4))
				elif STM < 25:
					attack = 4
					HP -= 10
			
			if attack == 0:
				anim.play("Attack 1 - Shoulder Balker")
			elif attack == 1:
				anim.play("Attack 2 - Sabith Verse")
			elif attack == 2:
				anim.play("Attack 3 - Triple Sabiths")
			elif attack == 3:
				anim.play("Attack 4 - Over Sabaths")
			
			ENABLED = false
			$Timer.stop()


func _on_PlayerFinder_body_entered(body):
	if body.is_in_group("Player"):
		if player == null:
			player = body
			$Timer.start()


func _on_Timer_timeout():
	if ENABLED:
		if HP > 125 * PlayerStats.LEG_LEVEL:
			attack = floor(rand_range(0, 2))
		if HP <= 125 * PlayerStats.LEG_LEVEL:
			attack = floor(rand_range(0, 4))
		if HP <= 60 * PlayerStats.LEG_LEVEL:
			if STM > 25:
				attack = floor(rand_range(2, 4))
			elif STM < 25:
				attack = 4
				HP -= 10 * PlayerStats.LEG_LEVEL
			
			if STM > 0:
				STM -= 10
		
		if attack == 0:
			anim.play("Attack 1 - Shoulder Balker")
		elif attack == 1:
			anim.play("Attack 2 - Sabith Verse")
		elif attack == 2:
			anim.play("Attack 3 - Triple Sabiths")
		elif attack == 3:
			anim.play("Attack 4 - Over Sabaths")
		
		ENABLED = false
		$Timer.stop()


func _on_HPBar_value_changed(value):
	if HP <= 0:
		ENABLED = false
		anim.play("Hurt")
		
		hurtsfx.play()
		hurtsfx.pitch_scale = 0.6
		
		var impactframe = impact.instance()
		get_parent().add_child(impactframe)
		
		impactframe.global_position = self.global_position
		
		Global.emit_signal("ENEMY_DEATH")
		
		$GhostTimer.stop()
		
		if $BGMusic.playing:
			$BGMusic.stop()
		if $AltBGMusic.playing:
			$AltBGMusic.stop()
		
		Global.camera.shake(200, 0.5)
		
		$HPLayer/ColorFX/Tween.interpolate_property($HPLayer/ColorFX, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		$HPLayer/ColorFX/Tween.start()
		
		if GlobalSettings.difficulty != 0:
			Global.emit_signal("NO_HIT")
			
			if not PlayerStats.BEAT_SACK:
				PlayerStats.BEAT_SACK = true
				Global.emit_signal("ACHIEVEMENT")
				Global.achieveddesc.text = "'Damn it, Damn you'"
				Global.achievedtitle.text = "YOU BEAT SACK!"
				Global.achievedsprite.frame = 2
				Global.achievedsprite.show()
			
			PlayerStats.EXP += 500 * GlobalSettings.difficulty
			PlayerStats.CASH += floor(rand_range(300, 500)) * GlobalSettings.difficulty 
		
		Engine.time_scale = 0.1
		yield(get_tree().create_timer(0.05),"timeout")
		Engine.time_scale = 1
	
	if HP <= 60:
		if $BGMusic.playing:
			$BGMusic.stop()
	
	if HP < MAX_HP and HP > 0:
		ENABLED = false
		anim.play("Hurt")
		
		var impactframe = impact.instance()
		get_parent().add_child(impactframe)
		
		impactframe.global_position = self.global_position
		
		hurtsfx.play()
		
		Global.camera.shake(90, 0.2)
		
		var damageindicator = dmgindi.instance()
		self.add_child(damageindicator)
		
		if player != null and player.PARRY:
			damageindicator.amount = PlayerStats.LEG_STRENGTH - 10
		else:
			damageindicator.amount = PlayerStats.LEG_STRENGTH
		
		damageindicator.position.y = -32


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Attack 1 - Shoulder Balker":
		$Timer.start()
	if anim_name == "Attack 2 - Sabith Verse":
		$Timer.start()
	if anim_name == "Attack 3 - Triple Sabiths":
		$Timer.start()
	if anim_name == "Attack 4 - Over Sabaths":
		$Timer.start()
	if anim_name == "Hurt":
		if ENABLED and not MidDialogue.dialogbox.visible:
			if ENEMIES < ENEMIESTAKENDOWN:
				if HP > 125:
					attack = floor(rand_range(0, 2))
				
				if HP <= 125:
					attack = floor(rand_range(0, 4))
					$Timer.wait_time = 2
					SPEED = 150
					anim.playback_speed = 1.1
				
				if HP <= 60:
					attack = 3
					$GhostTimer.start()
					$Timer.wait_time = 0.1
					
					if not $AltBGMusic.playing:
						$AltBGMusic.play()
						MAX_HP = 60
						HP = MAX_HP
						
						if PlayerStats.HP < PlayerStats.MAX_HP and PlayerStats.HP != 0:
							PlayerStats.HP = PlayerStats.MAX_HP
						
						$HPLayer/ColorFX/Tween.interpolate_property($HPLayer/ColorFX, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
						$HPLayer/ColorFX/Tween.start()
						
						$HPLayer/GuideAnimation.play("Guide")
					
					anim.playback_speed = 1.2
			
				if HP > 0:
					ENABLED = false
					$Timer.stop()
					
					if attack == 0:
						anim.play("Attack 1 - Shoulder Balker")
					elif attack == 1:
						anim.play("Attack 2 - Sabith Verse")
					elif attack == 2:
						anim.play("Attack 3 - Triple Sabiths")
					elif attack == 3:
						anim.play("Attack 4 - Over Sabaths")
			
			if HP <= 0:
				if ENEMIES >= ENEMIESTAKENDOWN:
					MidDialogue.text = Dialogue.dialogue_2
					MidDialogue.dialogue_index = 22
					MidDialogue.load_dialogue()
				
				anim.play("Defeat")
				
				ENABLED = false
				$Timer.stop()


func _on_GhostTimer_timeout():
	var ghostframes = ghostfx.instance()
	get_parent().add_child(ghostframes)
	
	ghostframes.global_position = self.global_position
	
	ghostframes.texture = spr.texture
	ghostframes.hframes = spr.hframes
	ghostframes.vframes = spr.vframes
	ghostframes.frame = spr.frame
	ghostframes.flip_h = spr.flip_h

