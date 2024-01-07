extends Area2D

onready var pos = $NormalPosition


func _on_Bounds_body_exited(body):
	if body.is_in_group("Player"):
		body.global_position = pos.global_position

