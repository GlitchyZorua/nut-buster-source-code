tool
extends RichTextEffect
class_name RichTextRed

var bbcode := "red"

func _process_custom_fx(char_fx):
	
	var speed = char_fx.env.get("speed", 5.0)
	
	var color := Color(255, 0, 0, 1)
	char_fx.color = color
	
	return true
