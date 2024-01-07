extends AnimatedSprite

export var STAYED_EXPRESSION = false


func _process(_delta):
	if MidDialogue.dialogname.text == self.name and not MidDialogue.finished and MidDialogue.dialogbox.visible:
		if MidDialogue.expression == 0:
			animation = "Idle"
		elif MidDialogue.expression == 1:
			animation = "Talking"
	
	elif MidDialogue.dialogtext.text == self.name and MidDialogue.finished and MidDialogue.dialogbox.visible:
		if STAYED_EXPRESSION:
			if MidDialogue.expression == 0:
				animation = "Idle"
			elif MidDialogue.expression == 1:
				animation = "Talking"
	
	elif MidDialogue.dialogtext.text != self.name and MidDialogue.finished and MidDialogue.dialogbox.visible:
		if not STAYED_EXPRESSION:
			animation = "Idle"
	
	elif not MidDialogue.dialogbox.visible:
		animation = "Idle"

