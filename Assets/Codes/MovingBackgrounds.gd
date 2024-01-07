extends ParallaxLayer

export (float) var scrolling_speed = 100.0

export (bool) var ENABLED = false
export (String) var DIRECTION = "Right"


func _process(delta):
	if ENABLED == true:
		if DIRECTION == "Right":
			motion_offset.x += scrolling_speed * delta
		elif DIRECTION == "Up":
			motion_offset.y += scrolling_speed * delta
		elif DIRECTION == "Left":
			motion_offset.x -= scrolling_speed * delta
		elif DIRECTION == "Down":
			motion_offset.y -= scrolling_speed * delta

