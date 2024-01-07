extends Control

onready var trans = $Transition/Animation


func _ready():
	trans.play("StaticTransitionOut")


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		trans.play("TransitionIn")


func _on_Animation_animation_finished(anim_name):
	if anim_name == "TransitionIn":
		if Global.baa:
			get_tree().change_scene("res://Assets/Scenes/Sections/Section " + String(PlayerStats.SECTION) + ".tscn")
		if Global.gaa:
			get_tree().change_scene("res://Assets/Scenes/Gaa Section/GaaSection " + String(GaaStats.SECTION) + ".tscn" )
		if Global.sack:
			get_tree().change_scene("res://Assets/Scenes/Sack Section/SackSection " + String(SackStats.SECTION) + ".tscn")

