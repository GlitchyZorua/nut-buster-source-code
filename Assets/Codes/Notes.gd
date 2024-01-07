extends Area2D

export (String) var DIRECTION = "Left"
export var NOTES = 0
export var SPEED = 2
export var ENABLED = true

onready var spr = $Note
onready var notetween = $Tween
var noteslicer = null
var missed = false


func _ready():
	spr.frame = NOTES
	notetween.interpolate_property(self, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 0.1, Tween.TRANS_QUAD, Tween.EASE_IN)
	notetween.start()


func _process(_delta):
	spr.frame = NOTES
	
	if ENABLED:
		if DIRECTION == "Right":
			position.x += SPEED
		elif DIRECTION == "Left":
			position.x -= SPEED
	
		input()


func easier():
	notetween.interpolate_property(self, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.1, Tween.TRANS_QUAD, Tween.EASE_OUT)
	notetween.interpolate_property(self, "scale", Vector2(1, 1), Vector2(2, 2), 0.1, Tween.TRANS_QUAD, Tween.EASE_OUT)
	notetween.start()
	
	ENABLED = false


func input():
	if noteslicer != null:
		if Input.is_action_just_pressed("ui_right"):
			noteslicer.border.play("Pressed")
			
			if NOTES == 3:
				if GlobalSettings.screenshake:
					noteslicer.cameraanim.play("CameraBop")
				
				noteslicer.sprite.play("Right")
				noteslicer.beat.play()
				
				if noteslicer.HP < 100:
					noteslicer.HP += 2
					noteslicer.beat.play()
				
				easier()
		
		
		if Input.is_action_just_pressed("ui_left"):
			noteslicer.border.play("Pressed")
			
			if NOTES == 1:
				if GlobalSettings.screenshake:
					noteslicer.cameraanim.play("CameraBop")
				
				noteslicer.sprite.play("Left")
				noteslicer.beat.play()
				
				if noteslicer.HP < 100:
					noteslicer.HP += 2
				
				easier()
		
		
		if Input.is_action_just_pressed("ui_up"):
			noteslicer.border.play("Pressed")
			
			if NOTES == 0:
				if GlobalSettings.screenshake:
					noteslicer.cameraanim.play("CameraBop")
				
				noteslicer.sprite.play("Up")
				noteslicer.beat.play()
				
				if noteslicer.HP < 100:
					noteslicer.HP += 2
				
				easier()
		
		
		if Input.is_action_just_pressed("ui_down"):
			noteslicer.border.play("Pressed")
			
			if NOTES == 2:
				if GlobalSettings.screenshake:
					noteslicer.cameraanim.play("CameraBop")
				
				noteslicer.sprite.play("Down")
				noteslicer.beat.play()
				
				if noteslicer.HP < 100:
					noteslicer.HP += 2
				
				easier()


func _on_Notes_area_entered(area):
	if area.is_in_group("NoteSlicer") and area != null:
		noteslicer = area


func _on_Notes_area_exited(area):
	if area.is_in_group("NoteSlicer"):
		yield(get_tree().create_timer(0.01),"timeout")
		noteslicer = null
		
		if noteslicer == null:
			if NOTES == 3:
				self.queue_free()
				get_parent().get_parent().get_parent().get_parent().get_node("MiniRhythm").sprite.play("MissedRight")
				get_parent().get_parent().get_parent().get_parent().get_node("MiniRhythm").miss.play()
				get_parent().get_parent().get_parent().get_parent().get_node("MiniRhythm").HP -= 2
				get_parent().get_parent().get_parent().get_parent().get_node("MiniRhythm").MISS += 1
			if NOTES == 1:
				self.queue_free()
				get_parent().get_parent().get_parent().get_parent().get_node("MiniRhythm").sprite.play("MissedLeft")
				get_parent().get_parent().get_parent().get_parent().get_node("MiniRhythm").miss.play()
				get_parent().get_parent().get_parent().get_parent().get_node("MiniRhythm").HP -= 2
				get_parent().get_parent().get_parent().get_parent().get_node("MiniRhythm").MISS += 1
			if NOTES == 0:
				self.queue_free()
				get_parent().get_parent().get_parent().get_parent().get_node("MiniRhythm").sprite.play("MissedUp")
				get_parent().get_parent().get_parent().get_parent().get_node("MiniRhythm").miss.play()
				get_parent().get_parent().get_parent().get_parent().get_node("MiniRhythm").HP -= 2
				get_parent().get_parent().get_parent().get_parent().get_node("MiniRhythm").MISS += 1
			if NOTES == 2:
				self.queue_free()
				get_parent().get_parent().get_parent().get_parent().get_node("MiniRhythm").sprite.play("MissedDown")
				get_parent().get_parent().get_parent().get_parent().get_node("MiniRhythm").miss.play()
				get_parent().get_parent().get_parent().get_parent().get_node("MiniRhythm").HP -= 2
				get_parent().get_parent().get_parent().get_parent().get_node("MiniRhythm").MISS += 1


func _on_Tween_tween_all_completed():
	if not ENABLED:
		self.queue_free()

