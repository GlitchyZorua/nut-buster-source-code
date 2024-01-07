extends KinematicBody2D

var dmgindi = preload("res://Assets/Scenes/Misc/DamageIndicator.tscn")

export(int) var SPEED = 200
export(bool) var ENABLED = true

export var HP = 1
export var STOP_ANIMATION = false
export var PARRY = false

export var DAMAGE = 1

var velocity: Vector2 = Vector2.ZERO
var knockback = Vector2.ZERO

var path: Array = []
var levelNavigation: Navigation2D = null
var player = null
var stand_still = false

onready var lineart = $Line2D
onready var anim = $Animation
onready var spr = $Sprite
onready var hpbar = $HPBar


func _ready():
	hpbar.max_value = HP
	hpbar.value = HP
	
	yield(get_tree(), "idle_frame")
	var tree = get_tree()
	if tree.has_group("LevelNavigation"):
		levelNavigation = tree.get_nodes_in_group("LevelNavigation")[0]
	if tree.has_group("Player"):
		player = tree.get_nodes_in_group("Player")[0]
	
	global_position = Global.player_initial_spawn_location


func _physics_process(_delta):
	hpbar.value = HP
	HP = 1
	
	lineart.global_position = Vector2.ZERO
	if player and levelNavigation and ENABLED:
		generate_path()
		navigate()
	move()


func navigate():
	if path.size() > 0:
		velocity = global_position.direction_to(path[1]) * SPEED
		
		if global_position == path[0]:
			path.pop_front()


func generate_path():
	if levelNavigation != null and player != null:
		path = levelNavigation.get_simple_path(global_position, player.position, true)
		lineart.points = path


func move():
	if ENABLED and player != null:
		if not stand_still:
			anim.play("Walk")
			
			if velocity.x > 0:
				spr.flip_h = true
				spr.offset.x = 2
			elif velocity.x < 0:
				spr.flip_h = false
				spr.offset.x = -2
		
		if stand_still:
			anim.play("Idle")
			velocity = Vector2.ZERO
			
			if global_position >= player.global_position:
				spr.flip_h = false
				spr.offset.x = -2
			elif global_position <= player.global_position:
				spr.flip_h = true
				spr.offset.x = 2
	
	else:
		velocity = Vector2.ZERO
	
	velocity = move_and_slide(velocity)


func _on_Close_body_entered(body):
	if body.is_in_group("Player"):
		stand_still = true


func _on_Close_body_exited(body):
	if body.is_in_group("Player"):
		stand_still = false


func _on_HPBar_value_changed(value):
	if HP < 1:
		ENABLED = false
		anim.seek(0, true)
		
		if spr.flip_h:
			anim.play("Miss Left")
		else:
			anim.play("Miss Right")
		
		var damageindicator = dmgindi.instance()
		self.add_child(damageindicator)
		
		damageindicator.enabled = false
		damageindicator.dmgtext.text = "Miss"
		damageindicator.dmgtext.modulate = Color(0.53, 0.53, 0.53, 1)
		damageindicator.position.y = -32


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Miss Right" or anim_name == "Miss Left":
		ENABLED = true

