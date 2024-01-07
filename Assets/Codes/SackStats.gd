extends Node

signal LEVELUP

var HP = 200
var MAX_HP = 200
var STM = 200
var MAX_STM = 200

var EXP = 0
var MAX_EXP = 1000
var CASH = 0
var DEATHS = 0
var POINTS = 0
var MAXPOINTS = 0

var STAFF_LEVEL = 1
var STAFF_STRENGTH = 50
var DAMAGED = false

var BOSS_CLEARED = 0
var HAS_PLAYED = 0
var MEMORIES = 0
var SECTION = 1


func save_game():
	var save_file = File.new()
	save_file.open("user://sack_save_game.json", File.WRITE)
	var data = {
		"STAFFLV" : STAFF_LEVEL,
		"STAFFSTR" : STAFF_STRENGTH,
		"PLAYED" : HAS_PLAYED,
		"MEMORIES" : MEMORIES,
		"CASH" : CASH,
		"EXP" : EXP,
		"MAXEXP" : MAX_EXP,
		"SECTION" : SECTION,
		"BOSSED" : BOSS_CLEARED,
		"DEATHS" : DEATHS,
	}
	
	var alt_save_file = File.new()
	alt_save_file.open("user://alt_sack_save_game.json", File.WRITE)
	var alt_data = {
		"DAMAGED" : DAMAGED
	}
	
	alt_save_file.store_var(alt_data)
	
	save_file.store_var(data)
	save_file.close()


func load_game():
	var save_file = File.new()
	if !save_file.file_exists("user://sack_save_game.json"):
		return
	
	var alt_save_file = File.new()
	if !save_file.file_exists("user://alt_sack_save_game.json"):
		return
	
	save_file.open("user://sack_save_game.json", File.READ)
	alt_save_file.open("user://alt_sack_save_game.json", File.READ)
	
	var data = save_file.get_var()
	var alt_data = alt_save_file.get_var()
	
	STAFF_LEVEL = data["STAFFLV"]
	STAFF_STRENGTH = data["STAFFSTR"]
	HAS_PLAYED = data["PLAYED"]
	MEMORIES = data["MEMORIES"]
	CASH = data["CASH"]
	EXP = data["EXP"]
	MAX_EXP = data["MAXEXP"]
	SECTION = data["SECTION"]
	BOSS_CLEARED = data["BOSSED"]
	DEATHS = data["DEATHS"]
	
	DAMAGED = alt_data["DAMAGED"]
	
	alt_save_file.close()
	save_file.close()

