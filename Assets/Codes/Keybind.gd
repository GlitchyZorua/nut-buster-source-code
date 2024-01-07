extends Tabs

var file_name = "res://keybindings.json"

var key_dict = {"ui_move_up": KEY_UP,
				"ui_move_right": KEY_RIGHT,
				"ui_move_left": KEY_LEFT,
				"ui_move_down": KEY_DOWN,
				"ui_attack": KEY_Z,
				"ui_dash": KEY_A,
				"ui_block": KEY_X,
				"ui_transformation": KEY_V,
				"ui_tp_behind": KEY_F,
				"ui_train": KEY_T,
				"ui_superkick": KEY_S,
				"ui_jump": KEY_G,
				"ui_fullscreen": KEY_F4,
				"ui_menu": KEY_C,
				"ui_decked": KEY_D,
				"ui_sucker": KEY_B,
				"ui_extra_skill_1": KEY_W,
				"ui_extra_skill_2": KEY_E,
				"ui_reset": KEY_R,}

var setting_key = false

func _ready():
	load_keys()


func load_keys():
	var file = File.new()
	if(file.file_exists(file_name)):
		delete_old_keys()
		file.open(file_name, File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		if(typeof(data) == TYPE_DICTIONARY):
			key_dict = data
			setup_keys()
		else:
			print("Corrupted Data")
	else:
		save_keys()


func setup_keys():
	for i in key_dict:
		for j in get_tree().get_nodes_in_group("button_keys"):
			if(j.action_name == i):
				j.text = OS.get_scancode_string(key_dict[i])
		
		var newkey = InputEventKey.new()
		newkey.scancode = int(key_dict[i])
		InputMap.action_add_event(i, newkey)


func delete_old_keys():
	for i in key_dict:
		var oldkey = InputEventKey.new()
		oldkey.scancode = int(Keybind.key_dict[i])
		InputMap.action_erase_event(i, oldkey)


func save_keys():
	var file = File.new()
	file.open(file_name, File.WRITE)
	file.store_string(to_json(key_dict))
	file.close()

