extends KinematicBody2D

var jikawebstring = preload("res://Assets/Scenes/Attacks/Jika/JikaWebstringAttack.tscn")
var dmgindi = preload("res://Assets/Scenes/Misc/DamageIndicator.tscn")

onready var hpbar = $HPBar
onready var anim = $Animation
onready var spr = $Sprite

export var HP = 1
export var ENABLED = true
export var STOP_ANIMATION = false
export var PARRY = false

export var DAMAGE = 1

var velocity = Vector2()
var knockback = Vector2.ZERO


func _ready():
	hpbar.max_value = HP
	hpbar.value = HP
	
	anim.play("Idle")


func _process(delta):
	hpbar.value = HP
	HP = 1
	
	if STOP_ANIMATION:
		anim.stop()


func knockbacked(fps):
	knockback = knockback.move_toward(Vector2.ZERO, 0 * fps)
	knockback = move_and_slide(knockback)


func go_back_to_idle():
	anim.play("Idle")


func do_the_web_attack():
	anim.play("Summon Web String")


func summon_webstring():
	var webstring = jikawebstring.instance()
	get_parent().add_child(webstring)


func _on_HPBar_value_changed(_value):
	if HP < 1:
		anim.seek(0, true)
		anim.play("Miss")
		
		var damageindicator = dmgindi.instance()
		self.add_child(damageindicator)
		
		damageindicator.enabled = false
		damageindicator.dmgtext.text = "Miss"
		damageindicator.dmgtext.modulate = Color(0.53, 0.53, 0.53, 1)
		damageindicator.position.y = -64


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Summon Web String":
		anim.play("Idle")
	
	if anim_name == "Miss":
		anim.play("Idle")
		
		if MidDialogue.tutorialpoints == 1:
			MidDialogue.tutorial(2)

