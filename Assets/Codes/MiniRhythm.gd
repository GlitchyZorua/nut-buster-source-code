extends Area2D

var notes = preload("res://Assets/Scenes/Misc/Notes.tscn")
onready var notepos = $CanvasLayer/NotesPos
onready var sprite = $Sprite
onready var border = $CanvasLayer/MiniGameBorder
onready var hpbar = $CanvasLayer/HPBar
onready var hpcounter = $CanvasLayer/HPBar/HPCounter
onready var cameraanim = $Camera/Animation

onready var beat = $Beat 
onready var miss = $Miss

onready var animation = $CanvasLayer/RhythmResults/AnimationPlayer

export var HP = 100
export var MISS = 0

var noted = null


func _ready():
	Global.mainmusic.stop()
	
	hpbar.value = HP
	hpcounter.text = str("TENSION: ", HP)
	
	yield(get_tree().create_timer(0.5),"timeout")
	$NotePlayer.play("Note 1")
	
	yield(get_tree().create_timer(0.7),"timeout")
	$Notes.play()
	$BGMusic.play()


func _process(_delta):
	Global.mainmusic.stop()
	
	hpbar.value = HP
	hpcounter.text = str("TENSION: ", HP)
	
	MinigameData.tension = HP
	MinigameData.misses = MISS
	
	if HP > 100:
		HP = 100
	
	if Input.is_action_just_pressed("ui_reset"):
		get_tree().reload_current_scene()
		MidDialogue.text = Dialogue.placeholder_dialogue
		MidDialogue.tutorialpoints = 0
		MidDialogue.dialogue_index = -1
		MidDialogue.load_dialogue()
	
	if Input.is_action_just_pressed("ui_skip") and $BGMusic.playing:
		get_tree().change_scene("res://Assets/Scenes/Sections/Section 18.1.tscn")


func up_note():
	var note = notes.instance()
	notepos.add_child(note)
	
	note.NOTES = 0
	note.global_position = notepos.global_position

func left_note():
	var note = notes.instance()
	notepos.add_child(note)
	
	note.NOTES = 1
	note.global_position = notepos.global_position

func down_note():
	var note = notes.instance()
	notepos.add_child(note)
	
	note.NOTES = 2
	note.global_position = notepos.global_position

func right_note():
	var note = notes.instance()
	notepos.add_child(note)
	
	note.NOTES = 3
	note.global_position = notepos.global_position


func _on_Sprite_animation_finished():
	sprite.play("Idle")


func _on_MiniGameBorder_animation_finished():
	border.play("Default")


func _on_BGMusic_finished():
	yield(get_tree().create_timer(0.5), "timeout")
	animation.play("Transition")
	MinigameData.finished = true

