extends KinematicBody2D

var impact = preload("res://Assets/Scenes/Misc/Impact.tscn")

onready var anim = $AnimationPlayer
onready var hurtsfx = $Hurt

var combo = 0


func _ready():
	anim.play("Idle")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Hurt":
		anim.play("Idle")
		
		if MidDialogue.tutorialpoints == 0 and combo >= 3:
			MidDialogue.tutorial(1)


func _on_HurtArea_area_entered(area):
	if area.is_in_group("Player"):
		var impactframe = impact.instance()
		get_parent().add_child(impactframe)
		
		impactframe.global_position = self.global_position
		
		combo += 1
		
		anim.play("Hurt")
		hurtsfx.play()

