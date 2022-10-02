extends Actor

func _ready():
	self.velocity.x = -speed.x

func _physics_process(delta):
	velocity.y += gravity * delta
	if is_on_wall():
		self.velocity.x *= -1.0
	self.velocity.y = move_and_slide(self.velocity, self.FLOOR_NORMAL).y

func _on_StompDetector_body_entered(body:Node):
	if body.global_position.y > $StompDetector.global_position.y:
		return
	queue_free()
	#$CollisionShape2D.disabled = true
	
