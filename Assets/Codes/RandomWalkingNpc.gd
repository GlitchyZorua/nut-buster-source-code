extends KinematicBody2D

var randomwalkingnpc1 = preload("res://Assets/Sprites/Sprite/RandomRatNpc6.png")
var randomwalkingnpc2 = preload("res://Assets/Sprites/Sprite/RandomRatNpc7.png")
var randomwalkingnpc3 = preload("res://Assets/Sprites/Sprite/RandomRatNpc8.png")
var randomwalkingnpc4 = preload("res://Assets/Sprites/Sprite/RandomRatNpc9.png")

export var DIRECTION = "Left"
export(int) var SPEED = 100

var velocity: Vector2 = Vector2.ZERO

var path: Array = []
var npcNavigation: Navigation2D = null
var leftspawner: Position2D
var rightspawner: Position2D
var sprite = 0
var theme = 0

onready var anim = $Animation
onready var shadow = $Shadow
onready var spr = $Sprite


func _ready():
	yield(get_tree(), "idle_frame")
	var tree = get_tree()
	if tree.has_group("NpcNavigation"):
		npcNavigation = tree.get_nodes_in_group("NpcNavigation")[0]
	if tree.has_group("LeftSpawner"):
		leftspawner = tree.get_nodes_in_group("LeftSpawner")[0]
	if tree.has_group("RightSpawner"):
		rightspawner = tree.get_nodes_in_group("RightSpawner")[0]
	
	texture()


func _process(_delta):
	if npcNavigation:
		generate_path()
		navigate()
	move()


func navigate():
	if path.size() > 0:
		velocity = global_position.direction_to(path[1]) * SPEED
		
		if global_position == path[0]:
			path.pop_front()


func generate_path():
	if npcNavigation != null:
		if DIRECTION == "Right":
			path = npcNavigation.get_simple_path(global_position, leftspawner.global_position - Vector2(0, floor(rand_range(-16, 32))), true)
		elif DIRECTION == "Left":
			path = npcNavigation.get_simple_path(global_position, rightspawner.global_position + Vector2(0, floor(rand_range(-16, 32))), true)


func texture():
	sprite = floor(rand_range(0, 4))
	
	if theme == 0:
		if sprite == 0:
			spr.texture = randomwalkingnpc1
			shadow.scale = Vector2(3, 0.8)
			shadow.position = Vector2(0, 0)
			SPEED = floor(rand_range(50, 100))
			anim.playback_speed = 1
		elif sprite == 1:
			spr.texture = randomwalkingnpc2
			shadow.scale = Vector2(1, 0.6)
			shadow.position = Vector2(0, 4.1)
			SPEED = floor(rand_range(150, 200))
			anim.playback_speed = 2
		elif sprite == 2:
			spr.texture = randomwalkingnpc3
			shadow.scale = Vector2(3.75, 0.6)
			shadow.position = Vector2(-4, 4.1)
			SPEED = floor(rand_range(40, 80))
			anim.playback_speed = 0.8
		elif sprite == 3:
			spr.texture = randomwalkingnpc4
			shadow.scale = Vector2(1.125, 0.515)
			shadow.position = Vector2(0, 7.61)
			SPEED = floor(rand_range(90, 100))
			anim.playback_speed = 0.8


func move():
	if DIRECTION == "Right":
		spr.flip_h = false
	elif DIRECTION == "Left":
		spr.flip_h = true
	
	velocity = move_and_slide(velocity)

