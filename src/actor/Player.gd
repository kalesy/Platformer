extends Actor

export var stomp_impulse = 1000.0
signal player_dead

func _physics_process(delta: float) -> void:
	#Input.get_action_strength this function returns the float result of the action move occurs
	# this is the integer version i think
	var is_jump_interrupted = Input.is_action_just_released("jump") and velocity.y < 0.0
	var direction = self.get_direction()
	self.velocity = calculate_move_velocity(self.velocity, direction, delta, is_jump_interrupted)
	self.velocity = move_and_slide(self.velocity, self.FLOOR_NORMAL)

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("moveRight") - Input.get_action_strength("moveLeft"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
	)

func calculate_move_velocity(
		velocity:Vector2,
		direction:Vector2,
		delta:float,
		is_jump_interrupted: bool
	) -> Vector2:
	velocity.x = self.speed.x * direction.x
	if direction.y < 0:
		velocity.y = self.speed.y * direction.y
	else:
		velocity.y += self.gravity * delta
	if is_jump_interrupted:
		velocity.y = 0.0
	return velocity

func calculate_stomp_velocity(velocity:Vector2) -> Vector2:
	velocity.y = -self.stomp_impulse
	return velocity

func _on_EnemyDetector_area_entered(_area:Area2D):
	self.velocity = self.calculate_stomp_velocity(self.velocity)


func _on_EnemyDetector_body_entered(_body:Node):
	print("You died!")
	emit_signal("player_dead")
