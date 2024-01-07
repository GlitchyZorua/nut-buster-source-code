extends KinematicBody2D

var dmgindi = preload("res://Assets/Scenes/Misc/DamageIndicator.tscn")
var impact = preload("res://Assets/Scenes/Misc/Impact.tscn")
var rock = preload("res://Assets/Scenes/Attacks/Gaa/TinyTINYRock.tscn")

onready var hpbar = $HPBar
onready var anim = $Animation
onready var spr = $Sprite

onready var hurtsfx = $Hurt

export var HP = 1
export var ENABLED = true
export var PARRY = false

export var DAMAGE = 1

var knockback = Vector2.ZERO
var velocity = Vector2()


func _ready():
	hpbar.value = HP
	hpbar.max_value = HP


func _process(delta):
	knockbacked(delta)
	
	hpbar.value = HP
	
	if HP <= 0:
		MidDialogue.text = Dialogue.placeholder_dialogue
		MidDialogue.tutorialpoints = 0
		MidDialogue.dialogue_index = -1
		MidDialogue.dialogbox.hide()
		MidDialogue.load_dialogue()
	
	if HP <= 0 and $GameOver/BG.visible:
		get_tree().paused = true


func attack():
	var rocks = rock.instance()
	get_parent().add_child(rocks)
	
	rocks.global_position = spr.global_position - Vector2(4, 0)
	
	if spr.flip_h:
		rocks.DIRECTION = "Left"
	else:
		rocks.DIRECTION = "Right"


func knockbacked(fps):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * fps)
	knockback = move_and_slide(knockback)


func _on_HPBar_value_changed(_value):
	if HP < 1:
		anim.play("Hurt")
		
		hurtsfx.play()
		
		Global.camera.shake(200, 0.5)
		Global.camera.zoom = Vector2(0.6, 0.6)
		get_parent().get_parent().get_node("BGMusic").stop()
		
		var impactframe = impact.instance()
		get_parent().get_parent().add_child(impactframe)
		
		impactframe.global_position.x = self.global_position.x
		impactframe.global_position.y = self.global_position.y
		
		var damageindicator = dmgindi.instance()
		self.add_child(damageindicator)
		
		damageindicator.amount = PlayerStats.LEG_STRENGTH * PlayerStats.LEG_LEVEL
		damageindicator.position.y = -16


func _on_Restart_pressed():
	get_tree().reload_current_scene()
	MidDialogue.text = Dialogue.placeholder_dialogue
	MidDialogue.tutorialpoints = 0
	MidDialogue.dialogue_index = -1
	MidDialogue.load_dialogue()
	get_tree().paused = false
	
	$GameOver/BG/Selected.play()


func _on_Quit_pressed():
	get_tree().change_scene("res://Assets/Scenes/Sections/Section 1.tscn")
	MidDialogue.text = Dialogue.placeholder_dialogue
	MidDialogue.tutorialpoints = 0
	MidDialogue.dialogue_index = -1
	MidDialogue.load_dialogue()
	get_tree().paused = false
	
	$GameOver/BG/Selected.play()


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Hurt" or anim_name == "ThrowStone":
		if HP < 1:
			anim.play("FadeIn")
			get_tree().paused = true
	
	if anim_name == "ThrowStone":
		anim.play("Idle")


func play_idle():
	anim.play("Idle")


func play_anticipation():
	anim.play("ThrowingStoneAnticipation")


func play_throwrock():
	anim.play("ThrowStone")


func _on_Stuff_mouse_entered():
	$GameOver/BG/Selecting.play()


func _on_Stuff_focus_entered():
	$GameOver/BG/Selecting

