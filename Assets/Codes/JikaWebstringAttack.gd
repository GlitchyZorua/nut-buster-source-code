extends Area2D

export var damage = 10
export var mana_intake = 10
var player = null


func _on_PlayerFinder_body_entered(body):
	if body.is_in_group("Player"):
		player = body


func _process(delta):
	if player != null:
		self.global_position = player.global_position


func _on_JikaWebstringAttack_body_entered(body):
	if body.is_in_group("Player"):
		SackStats.HP -= damage
		SackStats.STM -= mana_intake


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Webstring":
		self.queue_free()
		
		if MidDialogue.tutorialpoints == 2:
			MidDialogue.tutorial(3)

