extends Area2D

var memories = preload("res://Assets/Scenes/Misc/Memories.tscn")

onready var indi = $Indicator

export var INTERACT = false
export var MEMORY = 0


func _ready():
	if PlayerStats.SECTION == 4.5 and PlayerStats.MEMORIES < MEMORY:
		get_node("Animation").play("RESET")
	elif PlayerStats.SECTION == 4.5 and PlayerStats.MEMORIES >= MEMORY:
		get_node("Animation").play("OldManSal")


func _process(_delta):
	indi.visible = INTERACT
	
	
	if PlayerStats.SECTION == 4.5 and PlayerStats.MEMORIES < MEMORY:
		get_node("Animation").play("RESET")
	elif PlayerStats.SECTION == 4.5 and PlayerStats.MEMORIES >= MEMORY:
		get_node("Animation").play("OldManSal")
	
	
	if Input.is_action_just_pressed("ui_accept"):
		if INTERACT:
			INTERACT = false
			
			if PlayerStats.MEMORIES == 0:
				PlayerStats.MEMORIES += 1
				PlayerStats.CASH -= 100
			
				get_node("Animation").play("OldManSal")
			
				var memory = memories.instance()
				add_child(memory)
			
				memory.get_node("Control/Animation").play("Memory 1")


func _on_MemoryInteractor_body_entered(body):
	if body.is_in_group("Player"):
		if PlayerStats.MEMORIES < MEMORY:
			INTERACT = true


func _on_MemoryInteractor_body_exited(body):
	if body.is_in_group("Player"):
		INTERACT = false

