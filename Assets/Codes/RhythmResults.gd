extends Control

onready var misscounter = $BG2/MissCounter
onready var hpcounter = $BG2/HPCounter
onready var rank = $BG2/Rank

onready var misstimer = $BG2/MissCounter/Timer
onready var hptimer = $BG2/HPCounter/Timer

onready var baa = $BG2/Baa
onready var bgmusic = $BGMusic

var miss = 0
var hp = 0


func _process(delta):
	misscounter.text = str("MISS: ", miss)
	hpcounter.text = str("TENSION: ", hp)
	
	if Input.is_action_just_pressed("ui_skip"):
		$AnimationPlayer.play("Transitioning")
		$Swap.play()


func timing():
	misstimer.start()


func _on_MissTimer_timeout():
	if miss < MinigameData.misses:
		miss += 1
		$Tick.play()
		$Tick.pitch_scale += 0.05
	
	elif miss >= MinigameData.misses:
		miss = MinigameData.misses
		misstimer.stop()
		
		hptimer.start()
		$Tick.pitch_scale = 1


func _on_HPTimer_timeout():
	if hp < MinigameData.tension:
		hp += 1
		$Tick.play()
		$Tick.pitch_scale += 0.05
	
	elif hp >= MinigameData.tension:
		hp = MinigameData.tension
		hptimer.stop()
		bgmusic.play()
		
		if MinigameData.misses == 0:
			baa.play("Good")
			rank.bbcode_text = "OVERALL: [rainbow freq=1 sat=1]NUTTY!!!"
			$NoHit.play()
		
		
		if MinigameData.misses <= 10 and MinigameData.misses > 0:
			baa.play("Good")
			rank.bbcode_text = "OVERALL: [wave amp=10 freq=10]Good!"
			$Neutral.play()
		
		
		if MinigameData.misses > 10:
			baa.play("Neutral")
			rank.bbcode_text = "OVERALL: Eh... It's alright"
			$Neutral.play()
		
		
		if MinigameData.misses > 30:
			baa.play("Bad")
			rank.bbcode_text = "OVERALL: [shake rate=1000 level=10]your a failure"
			$Neutral.play()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Transitioning":
		get_tree().change_scene("res://Assets/Scenes/Sections/Section 18.1.tscn")

