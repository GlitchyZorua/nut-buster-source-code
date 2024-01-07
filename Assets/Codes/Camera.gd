extends Camera2D

onready var topLeft = $Limits/TopLeft
onready var bottomRight = $Limits/BottomRight

onready var shakeTimer = $Timer
onready var tween = $Tween

export var enabled = true

var shake_amount = 0
var default_offset = offset


func _ready():
	Global.camera = self
	
	limit_top = topLeft.position.y
	limit_left = topLeft.position.x
	limit_bottom = bottomRight.position.y
	limit_right = bottomRight.position.x
	
	if enabled:
		smoothing_enabled = false
		
		yield(get_tree().create_timer(1),"timeout")
		
		smoothing_enabled = true


func _process(delta):
	offset = Vector2(rand_range(-shake_amount, shake_amount), rand_range(shake_amount, -shake_amount)) * delta + default_offset


func shake(new_shake, shake_time = 0.2, shake_limit = 9999):
	if GlobalSettings.screenshake:
		shake_amount = 0
		shake_amount += new_shake
		if shake_amount > shake_limit:
			shake_amount = shake_limit
			
		shakeTimer.wait_time = shake_time
		
		tween.stop_all()
		shakeTimer.start()


func _on_Timer_timeout():
	shake_amount = 0
	
	tween.interpolate_property(self, "offset", offset, default_offset, 0.1, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.start()
