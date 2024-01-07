extends CanvasLayer

onready var anim = $Control/Animation
onready var sprite = $Control/Sprite

func _ready():
	get_tree().paused = true


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Memory 1":
		MidDialogue.text = Dialogue.memory_dialogue
		MidDialogue.dialogue_index = 0
		MidDialogue.load_dialogue()
		
		Global.emit_signal("ACHIEVEMENT")
		Global.achieveddesc.text = "This will be useful later on"
		Global.achievedtitle.text = "You got a memory!"
		Global.achievedsprite.hide()
		
		get_tree().paused = false
		self.queue_free()

