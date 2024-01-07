extends Control

onready var selecting = $Selecting
onready var selected = $Selected

onready var trans = $Transition/Animation
onready var spr = $Animation/Doodles
onready var sprchar = $Animation/Character
onready var sprcon = $Animation/Concept

onready var tween = $Tween

export var which = 0


func _ready():
	trans.play("TransitionOut")
	
	if Global.menu.playing:
		Global.menu.stop()


func _process(_delta):
	if Global.menu.playing:
		Global.menu.stop()
	
	if Input.is_action_just_pressed("ui_cancel"):
		trans.play("TransitionIn")
	
	if which < 0:
		which = 2
	if which > 2:
		which = 0
	
	if Input.is_action_just_pressed("ui_up"):
		which += 1
	
		if which == 0:
			tween.interpolate_property(spr, "position", Vector2(256, 496), Vector2(256, 152), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
			tween.interpolate_property(sprchar, "position", Vector2(256, 152), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
			tween.interpolate_property(sprcon, "position", Vector2(256, 496), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		if which == 1:
			tween.interpolate_property(spr, "position", Vector2(256, 152), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
			tween.interpolate_property(sprchar, "position", Vector2(256, 496), Vector2(256, 152), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
			tween.interpolate_property(sprcon, "position", Vector2(256, 496), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		if which == 2:
			tween.interpolate_property(spr, "position", Vector2(256, 496), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
			tween.interpolate_property(sprchar, "position", Vector2(256, 152), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
			tween.interpolate_property(sprcon, "position", Vector2(256, 496), Vector2(256, 152), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		if which > 2:
			tween.interpolate_property(spr, "position", Vector2(256, 496), Vector2(256, 152), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
			tween.interpolate_property(sprchar, "position", Vector2(256, 496), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
			tween.interpolate_property(sprcon, "position", Vector2(256, 152), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		
		tween.start()
		selecting.play()
	
	if Input.is_action_just_pressed("ui_down"):
		which -= 1
	
		if which == 0:
			tween.interpolate_property(spr, "position", Vector2(256, 496), Vector2(256, 152), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
			tween.interpolate_property(sprchar, "position", Vector2(256, 152), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
			tween.interpolate_property(sprcon, "position", Vector2(256, 496), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		if which == 1:
			tween.interpolate_property(spr, "position", Vector2(256, 496), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
			tween.interpolate_property(sprchar, "position", Vector2(256, 496), Vector2(256, 152), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
			tween.interpolate_property(sprcon, "position", Vector2(256, 152), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		if which == 2:
			tween.interpolate_property(spr, "position", Vector2(256, 496), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
			tween.interpolate_property(sprchar, "position", Vector2(256, 496), Vector2(256, 152), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
			tween.interpolate_property(sprcon, "position", Vector2(256, 152), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		if which < 0:
			tween.interpolate_property(spr, "position", Vector2(256, 152), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
			tween.interpolate_property(sprchar, "position", Vector2(256, 496), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
			tween.interpolate_property(sprcon, "position", Vector2(256, 496), Vector2(256, 152), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		
		tween.start()
		selecting.play()
	
	if Input.is_action_just_pressed("ui_right"):
		if which == 0:
			spr.frame += 1
		if which == 1:
			sprchar.frame += 1
		if which == 2:
			sprcon.frame += 1
		selecting.play()
	elif Input.is_action_just_pressed("ui_left"):
		if which == 0:
			spr.frame -= 1
		if which == 1:
			sprchar.frame -= 1
		if which == 2:
			sprcon.frame -= 1
		selecting.play()


func _on_Animation_animation_finished(anim_name):
	if anim_name == "TransitionIn":
		get_tree().change_scene("res://Assets/Scenes/Menu/Menu.tscn")


func _on_PointerRight_pressed():
	if which == 0:
		spr.frame += 1
	if which == 1:
		sprchar.frame += 1
	if which == 2:
		sprcon.frame += 1
	
	selecting.play()


func _on_PointerLeft_pressed():
	if which == 0:
		spr.frame -= 1
	if which == 1:
		sprchar.frame -= 1
	if which == 2:
		sprcon.frame -= 1
	
	selecting.play()


func _on_PointerDown_pressed():
	which -= 1
	
	if which == 0:
		tween.interpolate_property(spr, "position", Vector2(256, 496), Vector2(256, 152), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		tween.interpolate_property(sprchar, "position", Vector2(256, 152), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		tween.interpolate_property(sprcon, "position", Vector2(256, 496), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
	if which == 1:
		tween.interpolate_property(spr, "position", Vector2(256, 496), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		tween.interpolate_property(sprchar, "position", Vector2(256, 496), Vector2(256, 152), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		tween.interpolate_property(sprcon, "position", Vector2(256, 152), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
	if which == 2:
		tween.interpolate_property(spr, "position", Vector2(256, 496), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		tween.interpolate_property(sprchar, "position", Vector2(256, 496), Vector2(256, 152), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		tween.interpolate_property(sprcon, "position", Vector2(256, 152), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
	if which < 0:
		tween.interpolate_property(spr, "position", Vector2(256, 152), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		tween.interpolate_property(sprchar, "position", Vector2(256, 496), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		tween.interpolate_property(sprcon, "position", Vector2(256, 496), Vector2(256, 152), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
	
	tween.start()
	selecting.play()


func _on_PointerUp_pressed():
	which += 1
	
	if which == 0:
		tween.interpolate_property(spr, "position", Vector2(256, 496), Vector2(256, 152), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		tween.interpolate_property(sprchar, "position", Vector2(256, 152), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		tween.interpolate_property(sprcon, "position", Vector2(256, 496), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
	if which == 1:
		tween.interpolate_property(spr, "position", Vector2(256, 152), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		tween.interpolate_property(sprchar, "position", Vector2(256, 496), Vector2(256, 152), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		tween.interpolate_property(sprcon, "position", Vector2(256, 496), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
	if which == 2:
		tween.interpolate_property(spr, "position", Vector2(256, 496), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		tween.interpolate_property(sprchar, "position", Vector2(256, 152), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		tween.interpolate_property(sprcon, "position", Vector2(256, 496), Vector2(256, 152), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
	if which > 2:
		tween.interpolate_property(spr, "position", Vector2(256, 496), Vector2(256, 152), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		tween.interpolate_property(sprchar, "position", Vector2(256, 496), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
		tween.interpolate_property(sprcon, "position", Vector2(256, 152), Vector2(256, 496), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN)
	
	tween.start()
	selecting.play()

