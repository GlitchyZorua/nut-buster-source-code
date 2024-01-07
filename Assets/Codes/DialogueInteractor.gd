extends Area2D

export var ENABLED = true
export var DIALOGUE = 0
export var INTERACT = false
export var INDEX = 0
export var EVENT = 0
export var CUTSCENE = false
export var ALTERNATE_DIALOGUE = false
export var ALT_INDEX = 0

onready var indi = $Indicator


func _ready():
	indi.visible = false


func _process(_delta):
	indi.visible = INTERACT
	
	if ENABLED:
		if Input.is_action_just_pressed("ui_accept"):
			if INTERACT:
				INTERACT = false
				
				if Global.baa:
					baa_interacting()
				if Global.gaa:
					gaa_interacting()


func baa_interacting():
	if not ALTERNATE_DIALOGUE:
		MidDialogue.dialogue_index = INDEX
		ALTERNATE_DIALOGUE = true
	else:
		MidDialogue.dialogue_index = ALT_INDEX
	
	if DIALOGUE == 0:
		MidDialogue.text = Dialogue.dialogue_4
		MidDialogue.load_dialogue()
	
	if DIALOGUE == 1:
		MidDialogue.text = Dialogue.dialogue_5
		MidDialogue.load_dialogue()
			
	if DIALOGUE == 2:
		MidDialogue.text = Dialogue.dialogue_10
		MidDialogue.load_dialogue()
	
	if DIALOGUE == 3:
		MidDialogue.text = Dialogue.dialogue_13
		MidDialogue.load_dialogue()
	
	if DIALOGUE == 4:
		MidDialogue.text = Dialogue.dialogue_14
		MidDialogue.load_dialogue()


func gaa_interacting():
	if not CUTSCENE:
		if not ALTERNATE_DIALOGUE:
			MidDialogue.dialogue_index = INDEX
			ALTERNATE_DIALOGUE = true
		else:
			MidDialogue.dialogue_index = ALT_INDEX
	
	if DIALOGUE == 0:
		MidDialogue.text = Dialogue.gaa_dialogue_1
		MidDialogue.load_dialogue()
	
	if DIALOGUE == 1:
		MidDialogue.text = Dialogue.gaa_dialogue_2
		MidDialogue.load_dialogue()
	
	if DIALOGUE == 2:
		MidDialogue.text = Dialogue.gaa_dialogue_3
		MidDialogue.load_dialogue()
	
	if DIALOGUE == 3:
		MidDialogue.text = Dialogue.gaa_dialogue_5
		MidDialogue.load_dialogue()
	
	if EVENT == 1:
		get_parent().get_parent().get_node("Backgrounds/4/Door").queue_free()
		get_parent().get_parent().get_node("Walls/Portal").enabled = true
		get_parent().get_parent().get_node("Walls/Portal/Arrow/Pointer").show()
		
		ENABLED = false


func _on_DialogueInteractor_body_entered(body):
	if body.is_in_group("Player") and ENABLED:
		if not CUTSCENE:
			INTERACT = true
			body.ATTACKING = false
		
		if CUTSCENE:
			INTERACT = false
			body.ATTACKING = false
			
			CUTSCENE = false
			
			if Global.baa:
				baa_interacting()
			if Global.gaa:
				gaa_interacting()


func _on_DialogueInteractor_body_exited(body):
	if body.is_in_group("Player") and ENABLED:
		INTERACT = false
		body.ATTACKING = true

