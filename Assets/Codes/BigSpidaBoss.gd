extends KinematicBody2D

var dmgindi = preload("res://Assets/Scenes/Misc/DamageIndicator.tscn")
var parryshield = preload("res://Assets/Scenes/Misc/ParryShield.tscn")
var dashcloud = preload("res://Assets/Scenes/Misc/DashClouds.tscn")
var impact = preload("res://Assets/Scenes/Misc/Impact.tscn")
var ghostfx = preload("res://Assets/Scenes/Misc/GhostFrames.tscn")
var dmgtrash = preload("res://Assets/Scenes/Misc/DamagingTrash.tscn")
var bigfist = preload("res://Assets/Scenes/Attacks/BigSpidaBoss/BigSpidaHand.tscn")
var fallingspikes = preload("res://Assets/Scenes/Attacks/BigSpidaBoss/FallingSpikes.tscn")
var omnidirectionalslashes = preload("res://Assets/Scenes/Attacks/BigSpidaBoss/OmniDirectionalSlash.tscn")

var velocity = Vector2()
var knockback = Vector2.ZERO

export var UP = Vector2(0, -1)

export var HP = 300
export var MAX_HP = 300

export var DAMAGE = 5

export var ACCELERATION = 10000
export var SPEED = 80

export var CUTSCENE = false
export var ENABLED = true
export var PARRY = false
export var INVINCIBLE = false
export var RANDOM = false
export var STOP_ANIMATIONS = false

onready var spr = $Sprite
onready var anim = $Animation
onready var dmgarea = $DamageArea
onready var shadow = $Shadow
onready var timer = $Timer
onready var left = $Node/Left
onready var right = $Node/Right
onready var up = $Node/Up
onready var down = $Node/Down

onready var hpbar = $HPLayer/HPBar
onready var hpcounter = $HPLayer/HPBar/Title

var heal = true
var player = null
var attack = 0
var i = 0

func _ready():
	HP = MAX_HP
	
	timer.start()


func _process(delta):
	stats()
	
	if PlayerStats.HP <= 0 and HP <= 25:
		if not PlayerStats.SOCLOSE:
			PlayerStats.SOCLOSE = true
			Global.emit_signal("ACHIEVEMENT")
			Global.achieveddesc.text = "'i'm sorry for your lost lmao'"
			Global.achievedtitle.text = "SO CLOSE!!"
			Global.achievedsprite.frame = 10
			Global.achievedsprite.show()
			
			PlayerStats.save_game()
	
	if STOP_ANIMATIONS:
		anim.stop()
	
	if ENABLED and not MidDialogue.dialogbox.visible:
		accelerate_toward_point(player.global_position, delta)
		
		if velocity != Vector2.ZERO:
			anim.play("Idle")


func accelerate_toward_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity.x = max(direction.x-ACCELERATION, SPEED * direction.x)
	
	velocity = move_and_slide(velocity, UP)


func teleport():
	if player != null:
		self.global_position.x = player.global_position.x


func attacks():
	#---PHASE 1---#
	
	if HP > 200:
		if attack == 1:
			anim.play("Attack 1 - Clawthin")
			
			INVINCIBLE = true
			timer.wait_time = 1
			
			RANDOM = false
			
		if attack == 2:
			anim.play("Attack 2 - Pillar Crush")
			
			INVINCIBLE = true
			timer.wait_time = 1
			
			RANDOM = false
			
		if attack == 3:
			anim.play("Attack 3 - Double Clawthin")
			
			INVINCIBLE = true
			timer.wait_time = 1
			
			RANDOM = false
			
		if attack >= 4:
			anim.play("Scream")
			attack = 0
			
			INVINCIBLE = false
			timer.wait_time = 3
			
			RANDOM = false
	
	#---PHASE 2---#
	
	if HP <= 200:
		if attack == 1:
			anim.play("Attack 4 - Teleporting Clawthin")
			
			INVINCIBLE = true
			timer.wait_time = 1
			
			RANDOM = false
		
		if attack == 2:
			anim.play("Attack 5 - Smash Attack")
			
			INVINCIBLE = true
			timer.wait_time = 1
			
			RANDOM = true
		
		if attack == 3:
			anim.play("Attack 6 - Endangered Fist")
			
			INVINCIBLE = true
			timer.wait_time = 1
			
			RANDOM = false
		
		if attack >= 4:
			anim.play("Scream")
			attack = 0
			
			INVINCIBLE = false
			timer.wait_time = 3
			
			RANDOM = true
	
	#---PHASE 3---#
	
	if HP <= 100:
		if attack == 1:
			anim.play("Attack 7 - Triple Clawthin")
			
			INVINCIBLE = true
			timer.wait_time = 1
			
			RANDOM = false
		
		if attack == 2:
			anim.play("Attack 8 - More Endangered Fist")
			
			INVINCIBLE = true
			timer.wait_time = 1
			
			RANDOM = false
		
		if attack == 3:
			anim.play("Attack 5 - Smash Attack")
			
			INVINCIBLE = true
			timer.wait_time = 1
			
			RANDOM = false
		
		if attack >= 4:
			anim.play("Scream More")
			attack = 0
			
			INVINCIBLE = false
			timer.wait_time = 2
			
			RANDOM = true


func summon_trash():
	var trash = dmgtrash.instance()
	get_parent().add_child(trash)
	
	if player != null:
		if not RANDOM:
			trash.global_position = player.global_position
		else:
			trash.global_position.x = floor(rand_range(left.global_position.x, right.global_position.x))
			trash.global_position.y = floor(rand_range(left.global_position.y, up.global_position.y))


func summon_spikes():
	var spikes = fallingspikes.instance()
	get_parent().add_child(spikes)
	
	if player != null:
		if not RANDOM:
			spikes.global_position = player.global_position
		else:
			spikes.global_position.x = floor(rand_range(left.global_position.x, right.global_position.x))
			spikes.global_position.y = floor(rand_range(left.global_position.y, up.global_position.y))


func omni_directional_slashes():
	var slashes = omnidirectionalslashes.instance()
	get_parent().get_parent().add_child(slashes)
	
	i += 1
	
	if i >= 3:
		i = 1
	
	if player != null:
		if i == 1:
			slashes.global_position.x = left.global_position.x
			slashes.global_position.y = up.global_position.y - 320
		
		if i == 2:
			slashes.global_position.x = right.global_position.x
			slashes.global_position.y = up.global_position.y - 320


func throw_hands():
	var fist = bigfist.instance()
	get_parent().add_child(fist)
	
	if player != null:
		if not RANDOM:
			fist.global_position = player.global_position
		else:
			fist.ENABLED = false
			fist.global_position.x = floor(rand_range(left.global_position.x, right.global_position.x))
			fist.global_position.y = floor(rand_range(left.global_position.y, up.global_position.y))


func knockbacked(fps):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * fps)
	knockback = move_and_slide(knockback)


func _shake():
	Global.camera.shake(120, 0.5)


func timer_starting():
	attack = 0
	timer.start()


func stats():
	hpbar.value = HP
	hpbar.max_value = MAX_HP
	
	if HP < hpbar.min_value:
		HP = hpbar.min_value
	
	hpcounter.text = str("WTF IS DIS?! HP: ", HP, " / ", MAX_HP)


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Hurt" and not MidDialogue.dialogbox.visible:
		if HP > 0:
			ENABLED = true
			timer.start()
		
		if HP <= 100:
			anim.playback_speed = 1.2
			
			if PlayerStats.HP < PlayerStats.MAX_HP and heal:
				PlayerStats.HP = PlayerStats.MAX_HP
				heal = false
				
				$BGMusic.pitch_scale = 1.2
				$BGMusic.play()
		
		if HP <= 0:
			anim.playback_speed = 1
			PlayerStats.HP = PlayerStats.MAX_HP
			
			anim.play("Defeat")
			
			MidDialogue.text = Dialogue.dialogue_12
			MidDialogue.dialogue_index = 26
			MidDialogue.load_dialogue()
	
	if anim_name == "Attack 1 - Clawthin" or anim_name == "Attack 2 - Pillar Crush" or anim_name == "Attack 3 - Double Clawthin":
		ENABLED = true
		timer.start()
	
	if anim_name == "Attack 4 - Teleporting Clawthin" or anim_name == "Attack 5 - Smash Attack" or anim_name == "Attack 6 - Endangered Fist":
		ENABLED = true
		timer.start()
	
	if anim_name == "Attack 7 - Triple Clawthin" or anim_name == "Attack 8 - More Endangered Fist":
		ENABLED = true
		timer.start()
	
	if anim_name == "Scream" or anim_name == "Scream More":
		timer.wait_time = 3
		
		ENABLED = true
		timer.start()


func _on_Timer_timeout():
	if ENABLED and not MidDialogue.dialogbox.visible:
		attack += 1
		
		ENABLED = false
		timer.stop()
		
		attacks()


func _on_HPBar_value_changed(value):
	if HP <= 0:
		ENABLED = false
		anim.play("Hurt")
		timer.stop()
		
		if $BGMusic.playing:
			$BGMusic.stop()
		
		if GlobalSettings.difficulty != 0:
			Global.emit_signal("NO_HIT")
			
			PlayerStats.EXP += 500 * GlobalSettings.difficulty
			PlayerStats.CASH += floor(rand_range(100, 500)) * GlobalSettings.difficulty
	
	if HP <= 100:
		if $BGMusic.playing and heal:
			$BGMusic.stop()
	
	if HP < MAX_HP:
		Global.camera.shake(200, 0.5)
		
		anim.play("Hurt")
		ENABLED = false
		
		$Hurt.play()


func _on_HurtArea_body_entered(body):
	if body.is_in_group("DamagingTrash"):
		if HP > 0:
			HP -= body.DAMAGE
			
			body.queue_free()
			body.cloud()
		
		elif INVINCIBLE:
			body.queue_free()
			body.cloud()


func _on_PlayerFinder_body_entered(body):
	if body.is_in_group("Player"):
		player = body


func _on_DamageArea_body_entered(body):
	if body.is_in_group("Player") and HP > 0:
		if not player.PARRY and not player.BLOCK and not player.INVINCIBLE:
			player.knockback = Vector2.DOWN * 220
			player.velocity = player.knockback
			
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
			player.knockback = Vector2.DOWN * 100
			player.velocity = player.knockback
			
			if GlobalSettings.difficulty != 0:
				PlayerStats.HP -= 2


func _on_SubArea_body_entered(body):
	if body.is_in_group("Player") and HP > 0:
		if not player.PARRY and not player.BLOCK and not player.INVINCIBLE:
			player.knockback = Vector2.DOWN * 220
			player.velocity = player.knockback
			
			if GlobalSettings.difficulty != 0:
				player.ENABLED = true
				PlayerStats.HP -= DAMAGE * PlayerStats.LEG_LEVEL
		
		if player.BLOCK and not player.PARRY and player.ENABLED:
			player.knockback = Vector2.DOWN * 100
			player.velocity = player.knockback
			
			if GlobalSettings.difficulty != 0:
				PlayerStats.HP -= 2

