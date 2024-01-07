extends KinematicBody2D

var dmgindi = preload("res://Assets/Scenes/Misc/DamageIndicator.tscn")
var impact = preload("res://Assets/Scenes/Misc/Impact.tscn")
var dynamite = preload("res://Assets/Scenes/Attacks/Bombers/Dynamite.tscn")

var velocity = Vector2()
var knockback = Vector2.ZERO

export var UP = Vector2(0, -1)

export var HP = 25
export var MAX_HP = 25

export var DAMAGE = 5

export var ACCELERATION = 1000
export var SPEED = 100
export var EXP = 25

export var ENABLED = true
export var PARRY = false
export var BUSY = false

export var MIN_CASH = 10
export var MAX_CASH = 100

onready var spr = $Sprite
onready var cloud = $Cloud
onready var softcol = $SoftCollision
onready var shadow = $Shadow
onready var anim = $Animation
onready var noticearea = $NoticeArea

onready var hurtsfx = $Hurt

onready var hpbar = $HPBar

var player = null
var run = false


func _ready():
	ENABLED = false
	$AttackPos.position = Vector2(-16, 0)
	
	yield(get_tree().create_timer(0.5),"timeout")
	
	ENABLED = true


func _process(delta):
	stats()
	knockbacked(delta)
	
	if ENABLED and not MidDialogue.dialogbox.visible and not BUSY:
		move(delta)
	
	if player != null and ENABLED:
		if not run:
			accelerate_toward_point(player.global_position, delta)
		else:
			accelerate_away_point(player.global_position, delta)


func stats():
	hpbar.value = HP
	hpbar.max_value = MAX_HP


func move(fps):
	shadow.offset = spr.offset
	
	if velocity.x > 0:
		spr.flip_h = false
		noticearea.rotation_degrees = 0
		cloud.rotation_degrees = -135
		$AttackPos.position = Vector2(16, 0)
	if velocity.x < 0:
		spr.flip_h = true
		noticearea.rotation_degrees = -180
		cloud.rotation_degrees = -45
		$AttackPos.position = Vector2(-16, 0)
	
	if velocity.x != 0 or velocity.y != 0:
		anim.play("Run")
	
	elif velocity.x == 0 or velocity.y == 0:
		anim.play("Idle")
	
	if softcol.is_colliding():
		velocity += softcol.get_push_vector() * fps * 1200
	
	velocity = move_and_slide(velocity, UP)


func attack():
	var dynamited = dynamite.instance()
	get_parent().add_child(dynamited)
	
	dynamited.global_position = $AttackPos.global_position 
	
	if spr.flip_h:
		dynamited.DIRECTION = "Left"
	else:
		dynamited.DIRECTION = "Right"


func knockbacked(fps):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * fps)
	knockback = move_and_slide(knockback)


func accelerate_toward_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity.x = max(direction.x-ACCELERATION, SPEED * direction.x)
	velocity.y = min(direction.y+ACCELERATION, SPEED * direction.y)


func accelerate_away_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity.x = max(direction.x-ACCELERATION, -SPEED * direction.x)
	velocity.y = min(direction.y+ACCELERATION, -SPEED * direction.y)


func _on_PlayerFinder_body_entered(body):
	if body.is_in_group("Player"):
		if player == null:
			player = body


func _on_NoticeArea_body_entered(body):
	if body.is_in_group("Player"):
		if ENABLED and not MidDialogue.dialogbox.visible:
			anim.play("Throw Dynamite")


func _on_CloseArea_body_entered(body):
	if body.is_in_group("Player"):
		run = true


func _on_CloseArea_body_exited(body):
	if body.is_in_group("Player"):
		run = false


func _on_DmgArea_body_entered(body):
	if body.is_in_group("Enemy") and not self:
		$Animation.play("Exploded")
		
		if spr.flip_h:
			body.spr.flip_h = true
			body.knockback = Vector2.RIGHT * 200
		else:
			body.spr.flip_h = false
			body.knockback = Vector2.LEFT * 200
	
		body.HP -= DAMAGE
	
	if body.is_in_group("Player"):
		player = body
		
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
		
		if player.BLOCK and not player.PARRY and player.ENABLED:
			if spr.flip_h:
				player.spr.flip_h = true
				player.knockback = Vector2.RIGHT * 50
			else:
				player.spr.flip_h = false
				player.knockback = Vector2.LEFT * 50
			
			if GlobalSettings.difficulty != 0:
				PlayerStats.HP -= 1
				GaaStats.HP -= 1
				SackStats.HP -= 1


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
		impactframe.global_position.y = self.global_position.y - 8
		
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
		impactframe.global_position.y = self.global_position.y - 18
		
		var damageindicator = dmgindi.instance()
		self.add_child(damageindicator)
		
		if player != null and player.PARRY:
			damageindicator.amount = PlayerStats.LEG_STRENGTH * PlayerStats.LEG_LEVEL - 10 * PlayerStats.LEG_LEVEL
		else:
			damageindicator.amount = PlayerStats.LEG_STRENGTH * PlayerStats.LEG_LEVEL
		
		damageindicator.position.y = -16
		
		hpbar.visible = true
	else:
		hpbar.visible = false


func _on_AttackTimer_timeout():
	if ENABLED and not MidDialogue.dialogbox.visible and not BUSY:
		anim.play("Throw Dynamite")
		ENABLED = false
		
		$AttackTimer.stop()


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Throw Dynamite":
		$AttackTimer.start()
	
	if anim_name == "Hurt":
		if HP != 0:
			anim.play("Attack")
			$AttackTimer.start()
		
		if HP <= 0:
			ENABLED = false
			$AttackTimer.stop()
			
			anim.play("Death")
	
	if anim_name == "Death":
		self.queue_free()

