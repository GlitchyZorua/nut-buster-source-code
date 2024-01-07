extends Area2D


onready var campos = $CamPos


func _ready():
	pass


func _on_CameraPosition_body_entered(body):
	if body.is_in_group("Player"):
		body.camera.position = campos.position


func _on_CameraPosition_body_exited(body):
	if body.is_in_group("Player"):
		body.camera.position = Vector2(0, 0)
