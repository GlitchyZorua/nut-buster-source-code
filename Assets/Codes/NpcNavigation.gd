extends Node

var random_walking_npcs = preload("res://Assets/Scenes/Characters/RandomWalkingNpc1.tscn")

onready var leftspawn = $SpawnLeft
onready var rightspawn = $SpawnRight
onready var time = $Timer
var randomness = 0


func _ready():
	spawn_npc()
	time.start()


func spawn_npc():
	randomness = floor(rand_range(1, 3))
	
	var npc = random_walking_npcs.instance()
	get_parent().get_parent().add_child(npc)
	
	npc.modulate = get_parent().modulate
	
	if randomness == 1:
		npc.global_position = leftspawn.global_position + Vector2(24, 0)
		npc.DIRECTION = "Left"
	elif randomness == 2:
		npc.global_position = rightspawn.global_position - Vector2(24, 0)
		npc.DIRECTION = "Right"


func _on_Timer_timeout():
	spawn_npc()
	time.wait_time = floor(rand_range(1, 11))
	time.start()


func _on_Deletion_body_entered(body):
	if body.is_in_group("WalkingNpc"):
		body.queue_free()

