extends AnimatedSprite


func _ready():
	self.frame = 0
	$Cloud.emitting = true


func _process(_delta):
	if self.frame == 3:
		self.queue_free()
