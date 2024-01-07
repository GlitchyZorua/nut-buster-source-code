extends CanvasLayer

onready var anim = $Animation


func _ready():
	get_tree().paused = true
	Global.cutscene = true
	
	if Global.baa:
		anim.play("Baa")


func _on_Animation_animation_finished(anim_name):
	get_tree().paused = false
	
	Global.cutscene = false
	self.queue_free()

