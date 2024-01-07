extends CanvasLayer

onready var top = $Top
onready var bottom = $Bottom
onready var tween = $Tween


func _ready():
	top.visible = true
	bottom.visible = true

