extends Sprite

var bubble_skin = preload("res://Assets/Sprites/Misc/Bubble.png")

onready var tween = $ParryTween
onready var cloud = $Cloud
onready var parrysfx = $Parry


func _ready():
	parrysfx.play()
	
	tween.interpolate_property(self, "modulate", Color(1, 1, 1, 0.8), Color(1, 1, 1, 0), 0.2, Tween.TRANS_QUAD, Tween.EASE_IN)
	tween.interpolate_property(self, "scale", Vector2(1, 1), Vector2(1.5, 1.5), 0.2, Tween.TRANS_QUAD, Tween.EASE_IN)
	cloud.emitting = true
	tween.start()


func _on_Parry_finished():
	self.queue_free()

