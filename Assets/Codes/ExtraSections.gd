extends Node2D

onready var in_cutscene = $Cutscene

export var SECTION = 0


func _ready():
	PlayerStats.HP = PlayerStats.MAX_HP
	PlayerStats.STM = PlayerStats.MAX_STM
	
	if Global.menu.playing:
		Global.menu.stop()
	
	if not Global.extra:
		Global.extra = true
		
		if SECTION == 0:
			in_cutscene.play("Cutscene Extra 0")
		if SECTION == 1:
			in_cutscene.play("Cutscene Extra 1")
	else:
		if SECTION == 0:
			in_cutscene.play("Restart")
		if SECTION == 1:
			in_cutscene.play("RESET")


func _shake():
	Global.camera.shake(120, 0.5)

