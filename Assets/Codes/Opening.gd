extends Control

onready var anim = $Animation
onready var warningborder = $WarningBorder


func _ready():
	PlayerStats.load_game()
	GaaStats.load_game()
	SackStats.load_game()
	
	GlobalSettings.load_settings()
	
	if OS.get_name() != "HTML5":
		PlayerStats.secret_unfold("res://Assets/Scenes/Menu/Secret.tscn")
	
	if not GlobalSettings.flashingfx:
		$White.queue_free()


func _process(_delta):
	if not $DeviceBorder.visible:
		if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_attack"):
			if warningborder.visible:
				warningborder.hide()
				anim.play("Opening")
			else:
				teleport()


func teleport():
	get_tree().change_scene("res://Assets/Scenes/Menu/Menu.tscn")


func _on_PC_pressed():
	$Selected.play()
	$DeviceBorder.hide()
	
	GlobalSettings.mobile = false
	warningborder.show()


func _on_Mobile_pressed():
	$Selected.play()
	$DeviceBorder.hide()
	
	GlobalSettings.mobile = true
	warningborder.show()


func _on_Stuff_focus_entered():
	$Selecting.play()


func _on_Stuff_mouse_entered():
	$Selecting.play()

