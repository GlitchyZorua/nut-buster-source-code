extends Control

onready var anim = $Animation


func _ready():
	anim.play("TransitionOut")


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		anim.play("TransitionIn")


func _on_Animation_animation_finished(anim_name):
	if anim_name == "TransitionIn":
		get_tree().change_scene("res://Assets/Scenes/Menu/Menu.tscn")

