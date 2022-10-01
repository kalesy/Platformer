extends Actor

func _ready():
    self.velocity.x = -speed.x

func _physics_process(delta):
    velocity.y += gravity * delta
    if is_on_wall():
        self.velocity.x *= -1.0
    self.velocity.y = move_and_slide(self.velocity, self.FLOOR_NORMAL).y