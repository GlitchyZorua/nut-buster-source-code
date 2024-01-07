extends Area2D


export var offseter = 0


func _on_OffsetSetter_body_entered(body):
	if body.is_in_group("Player") or body.is_in_group("Enemy"):
		body.spr.offset.y = offseter


func _on_OffsetSetter_body_exited(body):
	if body.is_in_group("Player") or body.is_in_group("Enemy"):
		body.spr.offset.y = 0

