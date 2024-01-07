extends Area2D

onready var trans = $Transition/Animation
onready var indi = $Transition/Holder/Indicator
onready var inditween = $Transition/Holder/IndiTween
onready var indiholder = $Transition/Holder
onready var pointer = $Arrow/Pointer

export(String, FILE) var next_scene_path = ""
export(Vector2) var player_spawn_location = Vector2.ZERO

export var nutted = 0
export var truly_nutted = 0
export var max_nutted = 0
export var tutorial = 0

export var set = false
export var enabled = true
export var point = 0


func _ready():
	indi.visible = false
	truly_nutted = max_nutted
	
	Global.connect("ENEMY_DEATH", self, "nuts")
	Global.connect("TUTORIAL_END", self, "tutorial_ended")
	Global.connect("TIME_HAS_ENDED", self, "time_has_ended")
	trans.play("TransitionOut")
	
	if set:
		Global.player_initial_spawn_location = player_spawn_location


func _process(_delta):
	if enabled:
		if indiholder.visible and nutted == max_nutted:
			indiholder.hide()
		
		if nutted < max_nutted:
			$Arrow/Pointer.hide()
		elif nutted >= max_nutted:
			$Arrow/Pointer.show()
	
		indi.text = str("You need to kick ", truly_nutted, " people's nuts to dust!")


func _on_Portal_body_entered(body):
	if enabled:
		if body.is_in_group("Player"):
			if nutted >= max_nutted:
				Global.player_initial_spawn_location = player_spawn_location
				
				trans.play("TransitionIn")
				
				body.ENABLED = false
				body.CUTSCENE = true
				body.is_dashing = false
		
			elif nutted != max_nutted:
				indi.visible = true
				
				inditween.interpolate_property(indi, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 0.2, Tween.TRANS_QUAD, Tween.EASE_IN)
				inditween.interpolate_property(indiholder, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 0.5), 0.2, Tween.TRANS_QUAD, Tween.EASE_IN)
				inditween.start()


func _on_Portal_body_exited(body):
	if body.is_in_group("Player"):
		if nutted < max_nutted:
			inditween.interpolate_property(indi, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.2, Tween.TRANS_QUAD, Tween.EASE_IN)
			inditween.interpolate_property(indiholder, "modulate", Color(1, 1, 1, 0.5), Color(1, 1, 1, 0), 0.2, Tween.TRANS_QUAD, Tween.EASE_IN)
			inditween.start()


func _on_Animation_animation_finished(anim_name):
	if anim_name == "TransitionIn":
		get_tree().change_scene(next_scene_path)


func pointers():
	if point == 0:
		pointer.modulate = Color(1, 1, 1)
	if point == 1:
		pointer.modulate = Color(1, 0, 0)


func nuts():
	nutted += 1
	
	if truly_nutted > 0:
		truly_nutted -= 1


func tutorial_ended():
	if MidDialogue.tutorialpoints == tutorial:
		trans.play("TransitionIn")
		PlayerStats.TUTORIAL_PASSED = true
		PlayerStats.save_game()


func teleport():
	Global.player_initial_spawn_location = player_spawn_location
	trans.play("TransitionIn")

