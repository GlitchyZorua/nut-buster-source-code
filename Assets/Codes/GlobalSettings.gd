extends Node

var brightness = 0
var volume = 0
var sfx = 0

var difficulty = 2
var gaadifficulty = 2
var sackdifficulty = 2

var mobile = false
var screenshake = true
var lowquality = false
var flashingfx = true
var autopause = false
var fps = false


func _ready():
	load_settings()
	
	AudioServer.set_bus_volume_db(1, volume)
	AudioServer.set_bus_volume_db(2, sfx)


func _process(_delta):
	AudioServer.set_bus_volume_db(1, volume)
	AudioServer.set_bus_volume_db(2, sfx)
	
	if lowquality:
		get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_VIEWPORT, SceneTree.STRETCH_ASPECT_KEEP, Vector2(1024, 600), 2)
	else:
		get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D, SceneTree.STRETCH_ASPECT_KEEP, Vector2(1024, 600), 2)


func save_settings():
	var save_file = File.new()
	save_file.open("user://settings.json", File.WRITE)
	var data = {
		"VOLUME" : volume,
		"SFX" : sfx,
		"BRIGHTNESS" : brightness,
	}
	
	var alt_save_file = File.new()
	alt_save_file.open("user://alt_settings.json", File.WRITE)
	var alt_data = {
		"SCREENSHAKE" : screenshake,
		"QUALITY" : lowquality,
		"FLASHINGFX" : flashingfx,
		"AUTOPAUSE" : autopause,
		"FPS" : fps,
	}
	
	alt_save_file.store_var(alt_data)
	
	save_file.store_var(data)
	save_file.close()


func load_settings():
	var save_file = File.new()
	if !save_file.file_exists("user://settings.json"):
		return
	
	var alt_save_file = File.new()
	if !save_file.file_exists("user://alt_settings.json"):
		return
	
	save_file.open("user://settings.json", File.READ)
	alt_save_file.open("user://alt_settings.json", File.READ)
	
	var data = save_file.get_var()
	var alt_data = alt_save_file.get_var()
	
	screenshake = alt_data["SCREENSHAKE"]
	lowquality = alt_data["QUALITY"]
	flashingfx = alt_data["FLASHINGFX"]
	autopause = alt_data["AUTOPAUSE"]
	fps = alt_data["FPS"]
	brightness = data["BRIGHTNESS"]
	volume = data["VOLUME"]
	sfx = data["SFX"]
	
	alt_save_file.close()
	save_file.close()

