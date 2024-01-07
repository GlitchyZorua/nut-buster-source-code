extends CPUParticles2D


func _ready():
	yield(get_tree().create_timer(0.5),"timeout")
	self.queue_free()
