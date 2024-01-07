extends Node

signal LEVELUP

var HP = 50
var MAX_HP = 50
var STM = 100
var MAX_STM = 100

var EXP = 0
var MAX_EXP = 1000
var CASH = 100
var DEATHS = 0
var POINTS = 0
var MAXPOINTS = 0

var SCYTHE_LEVEL = 1
var SCYTHE_STRENGTH = 80
var DAMAGED = false

var HAS_POWER = false
var BOSS_CLEARED = 0
var HAS_PLAYED = 0
var MEMORIES = 0
var SECTION = 1

var KILLED = 0


func _process(_delta):
	if EXP >= MAX_EXP:
		EXP = 0
		MAX_EXP += MAX_EXP
		
		SCYTHE_LEVEL += 1
		POINTS += 50
		MAXPOINTS += 50
		
		HP = MAX_HP
		
		emit_signal("LEVELUP")


func save_game():
	var save_file = File.new()
	save_file.open("user://gaa_save_game.json", File.WRITE)
	var data = {
		"SCYTHELV" : SCYTHE_LEVEL,
		"SCYTHESTR" : SCYTHE_STRENGTH,
		"PLAYED" : HAS_PLAYED,
		"MEMORIES" : MEMORIES,
		"CASH" : CASH,
		"EXP" : EXP,
		"MAXEXP" : MAX_EXP,
		"SECTION" : SECTION,
		"KILLED" : KILLED,
		"BOSSED" : BOSS_CLEARED,
		"DEATHS" : DEATHS,
		"POINTS" : POINTS,
	}
	
	var alt_save_file = File.new()
	alt_save_file.open("user://alt_gaa_save_game.json", File.WRITE)
	var alt_data = {
		"DAMAGED" : DAMAGED,
		"POWER" : HAS_POWER,
	}
	
	alt_save_file.store_var(alt_data)
	
	save_file.store_var(data)
	save_file.close()


func load_game():
	var save_file = File.new()
	if !save_file.file_exists("user://gaa_save_game.json"):
		return
	
	var alt_save_file = File.new()
	if !save_file.file_exists("user://alt_gaa_save_game.json"):
		return
	
	save_file.open("user://gaa_save_game.json", File.READ)
	alt_save_file.open("user://alt_gaa_save_game.json", File.READ)
	
	var data = save_file.get_var()
	var alt_data = alt_save_file.get_var()
	
	SCYTHE_LEVEL = data["SCYTHELV"]
	SCYTHE_STRENGTH = data["SCYTHESTR"]
	HAS_PLAYED = data["PLAYED"]
	MEMORIES = data["MEMORIES"]
	CASH = data["CASH"]
	EXP = data["EXP"]
	MAX_EXP = data["MAXEXP"]
	SECTION = data["SECTION"]
	KILLED = data["KILLED"]
	BOSS_CLEARED = data["BOSSED"]
	DEATHS = data["DEATHS"]
	POINTS = data["POINTS"]
	
	DAMAGED = alt_data["DAMAGED"]
	HAS_POWER = alt_data["POWER"]
	
	alt_save_file.close()
	save_file.close()

