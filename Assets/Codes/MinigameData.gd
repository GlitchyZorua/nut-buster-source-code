extends Node

var tension = 0
var misses = 0
var finished = false


func save_minigame():
	var save_file = File.new()
	save_file.open("user://save_minigame.json", File.WRITE)
	var data = {
		"TENSION" : tension,
		"MISSES" : misses,
		}
	
	save_file.store_var(data)
	save_file.close()


func load_game():
	var save_file = File.new()
	if !save_file.file_exists("user://save_minigame.json"):
		return
	
	save_file.open("user://save_minigame.json", File.READ)
	
	var data = save_file.get_var()
	
	tension = data["TENSION"]
	misses = data["MISSES"]

