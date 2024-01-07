extends Position2D

onready var dmgtext = $Text
onready var tween = $Tween
var amount = 0
var type = 0

var velocity = Vector2.ZERO
export var enabled = true


func _ready():
	if enabled:
		dmgtext.text = str("Dmg: -", amount)
	
	randomize()
	var side_movement = randi() % 81 - 40
	
	velocity = Vector2(side_movement, 50)
	
	tween.interpolate_property(self, "scale", scale, Vector2(1.2, 1.2), 0.2, Tween.TRANS_QUAD, Tween.EASE_OUT)
	tween.interpolate_property(self, "scale", Vector2(1, 1), Vector2(0.1, 0.1), 0.8, Tween.TRANS_QUAD, Tween.EASE_OUT, 0.3)
	tween.start()


func _process(_delta):
	if enabled:
		dmgtext.text = str("Dmg: -", amount)


func _on_Tween_tween_all_completed():
	self.queue_free()

