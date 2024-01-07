extends Button

export(String) var action_name = ""
var do_set = false


func _pressed():
	text = ""
	do_set = true


func _input(event):
	if (do_set):
		if(event is InputEventKey):
			var newkey = InputEventKey.new()
			newkey.scancode = int(Keybind.key_dict[action_name])
			
			InputMap.action_erase_event(action_name, newkey)
			
			InputMap.action_add_event(action_name, event)
			
			text = OS.get_scancode_string(event.scancode)
			
			Keybind.key_dict[action_name] = event.scancode
			
			Keybind.save_keys()
			do_set = false

