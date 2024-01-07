extends Node

signal LEVELUP

var HP = 100
var MAX_HP = 100
var STM = 100
var MAX_STM = 100

var EXP = 0
var MAX_EXP = 1000
var CASH = 25
var DEATHS = 0
var POINTS = 0
var MAXPOINTS = 0

var LEG_LEVEL = 1
var LEG_STRENGTH = 25
var LEG_BOOST = false
var DAMAGED = false

var BOSS_CLEARED = 0
var HAS_PLAYED = 10
var MEMORIES = 0
var SECTION = 1
var SECTION_HAVE_BEATED = 1
var HAS_MET_LIANA = false
var TUTORIAL_PASSED = false
var CAN_JUMP = false

var BEAT_SACK = false
var FLASHED = false
var DEAF = false
var IPADDRESS = false
var HAPPYBAA = false
var VERYCLOSE = false
var FIRSTCRITIKAL = false
var SOCLOSE = false
var BEATED_SECTIONS = 0

var BEAT_ZERO = false
var BEAT_KILRO = false
var BEAT_PICO = false


func _ready():
	STM = MAX_STM


func _process(_delta):
	if EXP >= MAX_EXP:
		EXP = 0
		MAX_EXP += MAX_EXP
		
		LEG_LEVEL += 1
		POINTS += 15
		MAXPOINTS += 15
		
		HP = MAX_HP
		
		emit_signal("LEVELUP")
	
	if LEG_BOOST:
		yield(get_tree().create_timer(30),"timeout")
		LEG_BOOST = false


func save_game():
	var save_file = File.new()
	save_file.open("user://save_game.json", File.WRITE)
	var data = {
		"LEGLV" : LEG_LEVEL,
		"LEGSTR" : LEG_STRENGTH,
		"PLAYED" : HAS_PLAYED,
		"MEMORIES" : MEMORIES,
		"CASH" : CASH,
		"EXP" : EXP,
		"MAXEXP" : MAX_EXP,
		"SECTION" : SECTION,
		"BOSSED" : BOSS_CLEARED,
		"DEATHS" : DEATHS,
		"POINTS" : POINTS,
		"MAXPOINTS" : MAXPOINTS,
		"MAX_STM" : MAX_STM,
		"BEATEDSECTIONS" : BEATED_SECTIONS,
	}
	
	var alt_save_file = File.new()
	alt_save_file.open("user://alt_save_game.json", File.WRITE)
	var alt_data = {
		"LIANA" : HAS_MET_LIANA,
		"SACK" : BEAT_SACK,
		"DAMAGED" : DAMAGED,
		"FLASHED" : FLASHED,
		"DEAF" : DEAF,
		"IPADDRESS" : IPADDRESS,
		"HAPPYBAA" : HAPPYBAA,
		"FIRSTCRITIKAL" : FIRSTCRITIKAL,
		"SOCLOSE" : SOCLOSE,
		"BEATZERO" : BEAT_ZERO,
		"BEATKILRO" : BEAT_KILRO,
		"BEATPICO" : BEAT_PICO,
	}
	
	alt_save_file.store_var(alt_data)
	
	save_file.store_var(data)
	save_file.close()


func load_game():
	var save_file = File.new()
	if !save_file.file_exists("user://save_game.json"):
		return
	
	var alt_save_file = File.new()
	if !save_file.file_exists("user://alt_save_game.json"):
		return
	
	save_file.open("user://save_game.json", File.READ)
	alt_save_file.open("user://alt_save_game.json", File.READ)
	
	var data = save_file.get_var()
	var alt_data = alt_save_file.get_var()
	
	LEG_LEVEL = data["LEGLV"]
	LEG_STRENGTH = data["LEGSTR"]
	HAS_PLAYED = data["PLAYED"]
	MEMORIES = data["MEMORIES"]
	CASH = data["CASH"]
	EXP = data["EXP"]
	MAX_EXP = data["MAXEXP"]
	SECTION = data["SECTION"]
	BOSS_CLEARED = data["BOSSED"]
	DEATHS = data["DEATHS"]
	POINTS = data["POINTS"]
	MAXPOINTS = data["MAXPOINTS"]
	MAX_STM = data["MAX_STM"]
	BEATED_SECTIONS = data["BEATEDSECTIONS"]
	
	HAS_MET_LIANA = alt_data["LIANA"]
	BEAT_SACK = alt_data["SACK"]
	DAMAGED = alt_data["DAMAGED"]
	FLASHED = alt_data["FLASHED"]
	DEAF = alt_data["DEAF"]
	IPADDRESS = alt_data["IPADDRESS"]
	HAPPYBAA = alt_data["HAPPYBAA"]
	FIRSTCRITIKAL = alt_data["FIRSTCRITIKAL"]
	SOCLOSE = alt_data["SOCLOSE"]
	
	BEAT_ZERO = alt_data["BEATZERO"]
	BEAT_KILRO = alt_data["BEATKILRO"]
	BEAT_PICO = alt_data["BEATPICO"]
	
	alt_save_file.close()
	save_file.close()


func secret():
	var liana = File.new()
	liana.open(".//liana.txt", File.WRITE)
	
	var text = "Do NOT delete me player"
	
	liana.store_string(text)
	liana.close()


func secret_unfold(rooms):
	var liana = File.new()
	if !liana.file_exists(".//liana.txt"):
		if not HAS_MET_LIANA:
			get_tree().change_scene(rooms)
		else:
			get_tree().quit()
	
	liana.close()

