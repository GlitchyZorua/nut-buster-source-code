extends Sprite

onready var tween = $Tween


func _ready():
	tween.interpolate_property(self, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.5, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.start()


func _on_Tween_tween_all_completed():
	self.queue_free()

