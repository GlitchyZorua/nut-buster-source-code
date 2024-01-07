extends Control

onready var trans = $Transition/Animation
onready var selecting = $Selecting
onready var selected = $Selected

onready var difficultyborder = $DifficultyBorder

export var teleport = 0
var can_teleport = true


func _ready():
	trans.play("TransitionOut")
	Global.baa = true
	Global.gaa = false
	Global.sack = false
	Global.extra = false


func _process(_delta):
	if can_teleport:
		selecting()
		
		if teleport < 0:
			teleport = 3
		elif teleport > 3:
			teleport = 0
	
	if $Holder/Sprite.frame == 3:
		$Background.modulate = Color(0, 0, 0 ,1)
		if Global.menu.playing and Global.menu.pitch_scale != 0.1:
			Global.menu.pitch_scale = 0.1
	else:
		$Background.modulate = Color(1, 1, 1 ,1)
		if Global.menu.playing:
			Global.menu.pitch_scale = 1
	
	if Input.is_action_just_pressed("ui_cancel"):
		if not difficultyborder.visible:
			trans.play("TransitionIn")
			teleport = 100
			
			can_teleport = false
			
			$Holder/Back.disabled = true
			$Holder/Sprite/Enter.disabled = true
			$Holder/Sprite/PointerLeft.disabled = true
			$Holder/Sprite/PointerRight.disabled = true
		elif difficultyborder.visible:
			difficultyborder.hide()
			
			$Holder/Back.disabled = false
			$Holder/Sprite/Enter.disabled = false
			$Holder/Sprite/PointerLeft.disabled = false
			$Holder/Sprite/PointerRight.disabled = false
	
	if Input.is_action_just_pressed("ui_accept") and can_teleport:
		$Holder/Back.disabled = true
		$Holder/Sprite/Enter.disabled = true
		$Holder/Sprite/PointerLeft.disabled = true
		$Holder/Sprite/PointerRight.disabled = true
		
		if teleport == 2:
			difficultyborder.show()
			selected.play()
		
		if teleport == 3:
			if PlayerStats.MEMORIES >= 0:
				difficultyborder.show()
				selected.play()
			else:
				$Error.play()
				
				$Holder/Indicator.visible = true
				yield(get_tree().create_timer(2), "timeout")
				$Holder/Indicator.visible = false
		
		if teleport != 0:
			difficultyborder.show()
			difficultyborder.get_node("Border/Soft").grab_focus()
			selected.play()
		elif teleport == 0:
			trans.play("TransitionIn")
			selected.play()


func selecting():
	if teleport != 100 and not difficultyborder.visible:
		$Holder/Sprite.frame = teleport
		
		if Input.is_action_just_pressed("ui_right"):
			teleport += 1
			$Selecting.play()
		elif Input.is_action_just_pressed("ui_left"):
			teleport -= 1
			$Selecting.play()


func _on_Animation_animation_finished(anim_name):
	if anim_name == "TransitionIn":
		if teleport == 0:
			get_tree().change_scene("res://Assets/Scenes/Menu/Gallery.tscn")
		if teleport == 3:
			get_tree().change_scene("res://Assets/Scenes/Sections/Section Extra 0.tscn")
		if teleport == 2:
			get_tree().change_scene("res://Assets/Scenes/Sections/Section Extra 1.tscn")
		if teleport == 1:
			get_tree().change_scene("res://Assets/Scenes/Sections/Section Extra 2.tscn")
		if teleport == 100:
			get_tree().change_scene("res://Assets/Scenes/Menu/Menu.tscn")
			Global.menu.pitch_scale = 1


func _on_Back_pressed():
	$Holder/Back.disabled = true
	$Holder/Sprite/Enter.disabled = true
	$Holder/Sprite/PointerLeft.disabled = true
	$Holder/Sprite/PointerRight.disabled = true
	
	$Holder/Back.release_focus()
	
	trans.play("TransitionIn")
	teleport = 100
	can_teleport = false
	selected.play()


func _on_Stuff_focus_entered():
	selecting.play()


func _on_Stuff_mouse_entered():
	selecting.play()


func _on_PointerRight_pressed():
	teleport += 1
	$Selecting.play()
	
	$Holder/Sprite/PointerRight.release_focus()


func _on_PointerLeft_pressed():
	teleport -= 1
	$Selecting.play()
	
	$Holder/Sprite/PointerLeft.release_focus()


func _on_Enter_pressed():
	$Holder/Back.disabled = true
	$Holder/Sprite/Enter.disabled = true
	$Holder/Sprite/PointerLeft.disabled = true
	$Holder/Sprite/PointerRight.disabled = true
	
	if teleport == 2:
		difficultyborder.show()
		selected.play()
	
	if teleport == 3:
		if PlayerStats.MEMORIES >= 0:
			difficultyborder.show()
			difficultyborder.get_node("Border/Soft").grab_focus()
			selected.play()
		else:
			$Error.play()
			
			$Holder/Indicator.visible = true
			yield(get_tree().create_timer(2), "timeout")
			$Holder/Indicator.visible = false

	if teleport != 0:
		difficultyborder.show()
		selected.play()
	elif teleport == 0:
		trans.play("TransitionIn")
		selected.play()


func _on_Hard_pressed():
	GlobalSettings.difficulty = 2
	trans.play("TransitionIn")
	selected.play()
	
	$DifficultyBorder.hide()


func _on_Soft_pressed():
	GlobalSettings.difficulty = 1
	trans.play("TransitionIn")
	selected.play()
	
	$DifficultyBorder.hide()


func _on_Baby_pressed():
	GlobalSettings.difficulty = 0
	trans.play("TransitionIn")
	selected.play()
	
	$DifficultyBorder.hide()

