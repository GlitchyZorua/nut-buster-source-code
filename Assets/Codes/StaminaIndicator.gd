extends Label

onready var tween = $STMTween
onready var shakeTimer = $ShakeTimer

var shake_amount = 0
var default_offset = Vector2(8, 272)


func _ready():
	self.hide()


func _process(delta):
	rect_position = Vector2(rand_range(-shake_amount, shake_amount), rand_range(shake_amount, -shake_amount)) * delta + default_offset


func shake(new_shake, shake_time = 0.2, shake_limit = 9999):
	shake_amount = 0
	shake_amount += new_shake
	
	if shake_amount > shake_limit:
		shake_amount = shake_limit
	
	shakeTimer.wait_time = shake_time
	
	tween.stop_all()
	shakeTimer.start()


func _on_ShakeTimer_timeout():
	shake_amount = 0
	
	tween.interpolate_property(self, "rect_position", rect_position, default_offset, 0.1, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.start()


func _on_STMTween_tween_all_completed():
	self.hide()

