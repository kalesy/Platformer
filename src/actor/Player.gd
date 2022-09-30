extends Actor

func _physics_process(delta: float) -> void:
	#Input.get_action_strength this function returns the float result of the action move occurs
	# this is the integer version i think
	var direction = Vector2(
		Input.get_action_strength("moveRight") - Input.get_action_strength("moveLeft"),
		1.0
	)
	velocity = speed * direction
	velocity = move_and_slide(velocity)