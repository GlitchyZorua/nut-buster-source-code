extends Area2D

export var damage = 10 * 2
export var mana_intake = 10


func _on_SackWebstringAttack_body_entered(body):
	if body.is_in_group("Enemy"):
		body.HP -= SackStats.STAFF_STRENGTH * 0.2
		SackStats.STM += mana_intake


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Webstring":
		self.queue_free()
		
		if MidDialogue.tutorialpoints == 3:
			MidDialogue.tutorial(4)

