extends Control



func _ready():
	if Global.mainmusic.playing:
		Global.mainmusic.stop()


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Elevator Cutscene":
		get_tree().change_scene("res://Assets/Scenes/Gaa Section/GaaSection 3.tscn")

