extends Node

signal PARRY
signal ENEMY_DEATH
signal TUTORIAL_END
signal ACHIEVEMENT
signal NO_HIT
signal TIME_HAS_ENDED

onready var menu = $Menu
onready var mainmusic = $Battle

onready var fpscounter = $Brightness/FPSCounter
onready var achievedanim = $Achieved
onready var achieveddesc = $Achieved/CanvasLayer/Border/Description
onready var achievedsprite = $Achieved/CanvasLayer/Border/Trophies
onready var achievedtitle = $Achieved/CanvasLayer/Border/Title
onready var chasetimer = $CountingTime/Timer

onready var brightness = $Brightness/Brightner

var player_initial_spawn_location = Vector2(80, 224)

var camera = null
var cutscene = false
var extra = false

var baa = true
var gaa = false
var sack = false

var timer_has_started = false
var has_played = false


func _ready():
	VisualServer.set_default_clear_color(Color(0, 0, 0, 1))
	
	self.connect("ACHIEVEMENT", self, "achieved")


func _process(_delta):
	VisualServer.set_default_clear_color(Color(0, 0, 0, 1))
	
	$CountingTime/Border.visible = timer_has_started
	$CountingTime/Border/TimeCount.text = str("TIME LEFT: ", $CountingTime/Timer.time_left)
	
	fpscounter.text = str("FPS: ", Engine.get_frames_per_second())
	fpscounter.visible = GlobalSettings.fps
	
	if GlobalSettings.brightness == 5:
		brightness.energy = 100
	elif GlobalSettings.brightness >= 0:
		brightness.energy = GlobalSettings.brightness
	
	if timer_has_started and chasetimer.time_left <= 0.10:
		if Input.is_action_just_pressed("ui_cancel"):
			if not PlayerStats.VERYCLOSE:
				PlayerStats.VERYCLOSE = true
				Global.emit_signal("ACHIEVEMENT")
				Global.achieveddesc.text = "'h-how did you paused so close to 0 holy-'"
				Global.achievedtitle.text = "OH MY GOD WTF HOW"
				Global.achievedsprite.frame = 8
				Global.achievedsprite.show()
				
				PlayerStats.save_game()
	
	if Input.is_action_just_pressed("ui_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen


func achieved():
	achievedanim.play("Goes In")
	PlayerStats.save_game()


func timer_start(amount_time):
	if not timer_has_started:
		$CountingTime/Timer.wait_time = amount_time
		$CountingTime/Timer.start()
		
		$CountingTime/TimerAnimation.play("Timer")
		
		timer_has_started = true


func timer_stop():
	$CountingTime/TimerAnimation.stop()
	$CountingTime/Timer.stop()
	timer_has_started = false


func _on_Timer_timeout():
	emit_signal("TIME_HAS_ENDED")
	
	$CountingTime/TimerAnimation.stop()
	$CountingTime/Timer.stop()
	timer_has_started = false

