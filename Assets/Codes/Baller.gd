extends KinematicBody2D

var dmgindi = preload("res://Assets/Scenes/Misc/DamageIndicator.tscn")
var impact = preload("res://Assets/Scenes/Misc/Impact.tscn")
var parryshield = preload("res://Assets/Scenes/Misc/ParryShield.tscn")
var dashcloud = preload("res://Assets/Scenes/Misc/DashClouds.tscn")

var velocity = Vector2()
var knockback = Vector2.ZERO

export var UP = Vector2(0, -1)

export var HP = 1
export var MAX_HP = 1

export var DAMAGE = 5

export var ACCELERATION = 1000
export var SPEED = 100
export var EXP = 25

export var ENABLED = true
export var PARRY = true
export var TIRED = false

export var MIN_CASH = 10
export var MAX_CASH = 100

onready var spr = $Sprite
onready var anim = $Animation
onready var dmgarea = $DamageArea
onready var noticearea = $NoticeArea
onready var cloud = $HurtArea/Cloud
onready var shadow = $Shadow
onready var softcollision = $SoftCollision

onready var hurtsfx = $Hurt

onready var hpbar = $HPBar
onready var stmbar = $STMBar

var player = null
var target = null
var attack = 0

func _ready():
	stmbar.hide()


func _process(delta):
	stats()
	knockbacked(delta)
	
	if dmgarea.get_node("Collision").disabled == false:
		yield(get_tree().create_timer(0.2),"timeout")
		dmgarea.get_node("Collision").disabled = true
	
	if ENABLED and not TIRED:
		move(delta)
	
	if player != null and ENABLED:
		accelerate_toward_point(player.global_position, delta)


func stats():
	if HP > 0:
		if stmbar.value < stmbar.max_value:
			stmbar.show()
		if stmbar.value == stmbar.max_value:
			stmbar.hide()
	
	if stmbar.value < stmbar.max_value and HP > 0:
		stmbar.value += 0.1
	
	hpbar.value = HP
	hpbar.max_value = MAX_HP


func move(fps):
	shadow.offset = spr.offset
	
	if velocity.x > 0:
		spr.flip_h = true
	if velocity.x < 0:
		spr.flip_h = false
	
	if spr.flip_h:
		dmgarea.rotation_degrees = 0
		dmgarea.knockback_vector = velocity
		noticearea.rotation_degrees = 0
	else:
		dmgarea.rotation_degrees = -180
		dmgarea.knockback_vector = velocity
		noticearea.rotation_degrees = -180
	
	if velocity.x != 0 or velocity.y != 0:
		anim.play("Walk")
	
	elif velocity.x == 0 or velocity.y == 0:
		anim.play("Idle")
	
	if softcollision.is_colliding():
		velocity += softcollision.get_push_vector() * fps * 1200
	
	velocity = move_and_slide(velocity, UP)


func accelerate_toward_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity.x = max(direction.x-ACCELERATION, SPEED * direction.x)
	velocity.y = min(direction.y+ACCELERATION, SPEED * direction.y)


func teleport():
	stmbar.value -= 25
	
	if player.spr.flip_h:
		self.position.x = player.global_position.x + 16
		self.position.y = player.global_position.y
	else:
		self.position.x = player.global_position.x - 16
		self.position.y = player.global_position.y
	
	var dashfx = dashcloud.instance()
	get_parent().add_child(dashfx)
	
	dashfx.get_node("Sprite").frame = spr.frame
	dashfx.get_node("Sprite").hframes = spr.hframes
	dashfx.get_node("Sprite").vframes = spr.vframes
	dashfx.get_node("Sprite").texture = spr.texture
	dashfx.get_node("Tween").interpolate_property(dashfx.get_node("Sprite"), "modulate", Color(0, 0, 0, 1), Color(0, 0, 0, 0), 0.2, Tween.TRANS_QUAD, Tween.EASE_IN)
	dashfx.get_node("Tween").start()
	
	if player != null:
		if player.spr.flip_h:
			spr.flip_h = false
			dmgarea.rotation_degrees = -180
			dmgarea.knockback_vector = velocity
			noticearea.rotation_degrees = -180
			dashfx.get_node("Sprite").rotation_degrees = 0
			dashfx.get_node("Sprite").flip_h = true
			
		else:
			spr.flip_h = true
			dmgarea.rotation_degrees = 0
			dmgarea.knockback_vector = velocity
			noticearea.rotation_degrees = 0
			dashfx.get_node("Sprite").rotation_degrees = -180
			dashfx.get_node("Sprite").flip_h = false
	
	if spr.flip_h:
		dashfx.rotation_degrees = -180
	else:
		dashfx.rotation_degrees = 0
	
	dashfx.global_position = self.global_position
	
	dashfx.emitting = true
	dashfx.one_shot = true
	dashfx.modulate = self.modulate
	
	$Teleport.play()


func dies():
	self.queue_free()


func knockbacked(fps):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * fps)
	knockback = move_and_slide(knockback)


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
			
			HP -= PlayerStats.LEG_STRENGTH - 10
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
			
			HP -= PlayerStats.LEG_STRENGTH * 0.2
			
			$Timer.start()
		
		if player.BLOCK and not player.PARRY and player.ENABLED:
			if spr.flip_h:
				player.spr.flip_h = true
				player.knockback = Vector2.RIGHT * 50
			else:
				player.spr.flip_h = false
				player.knockback = Vector2.LEFT * 50
			
			if GlobalSettings.difficulty != 0:
				PlayerStats.HP -= 1


func _on_PlayerFinder_body_entered(body):
	if body.is_in_group("Player"):
		if player == null:
			player = body


func _on_NoticeArea_body_entered(body):
	if body.is_in_group("Player"):
		if ENABLED and HP > 0:
			if stmbar.value > 25:
				teleport()
				anim.play("Attack")
				
				target = body


func _on_NoticeArea_body_exited(body):
	if body.is_in_group("Player"):
		target = null


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Attack":
		if target != null:
			if ENABLED and HP > 0:
				if stmbar.value > 25:
					teleport()
					anim.play("Attack")
	
	if anim_name == "Hurt":
		if HP != 0:
			anim.play("Attack")
			$Timer.stop()
		
		if HP <= 0:
			ENABLED = false
			$Timer.stop()
			
			anim.play("Dies")


func _on_Timer_timeout():
	if ENABLED and HP > 0 and not TIRED:
		ENABLED = false
		anim.play("Attack")
	
		$Timer.stop()


func _on_HPBar_value_changed(value):
	if HP <= 0:
		ENABLED = false
		anim.play("Hurt")
		
		hurtsfx.play()
		hurtsfx.pitch_scale = 0.6
		
		Global.camera.shake(200, 0.5)
		
		var impactframe = impact.instance()
		get_parent().get_parent().add_child(impactframe)
		
		impactframe.global_position.x = self.global_position.x
		impactframe.global_position.y = self.global_position.y
		
		stmbar.hide()
		
		if GlobalSettings.difficulty != 0:
			PlayerStats.EXP += EXP * GlobalSettings.difficulty
			PlayerStats.CASH += floor(rand_range(MIN_CASH, MAX_CASH)) * GlobalSettings.difficulty
		
		Global.emit_signal("ENEMY_DEATH")
		
		Engine.time_scale = 0.1
		yield(get_tree().create_timer(0.05),"timeout")
		Engine.time_scale = 1
	
	if HP < MAX_HP and HP > 0:
		ENABLED = false
		anim.play("Hurt")
		
		hurtsfx.play()
		
		Global.camera.shake(90, 0.2)
		
		var impactframe = impact.instance()
		get_parent().get_parent().add_child(impactframe)
		
		impactframe.global_position.x = self.global_position.x
		impactframe.global_position.y = self.global_position.y
		
		var damageindicator = dmgindi.instance()
		self.add_child(damageindicator)
		
		if player.PARRY and player != null:
			damageindicator.amount = PlayerStats.LEG_STRENGTH * PlayerStats.LEG_LEVEL - 10 * PlayerStats.LEG_LEVEL
		else:
			damageindicator.amount = PlayerStats.LEG_STRENGTH * PlayerStats.LEG_LEVEL
		
		damageindicator.position.y = -112
		
		hpbar.visible = true
	else:
		hpbar.visible = false


func _on_STMBar_value_changed(value):
	if stmbar.value < 25 and ENABLED == true:
		TIRED = true
		PARRY = false
		
		anim.play("Tired")
		$Timer.stop()
		
	if stmbar.value == 25:
		TIRED = false
		PARRY = true
		
		$Timer.stop()




