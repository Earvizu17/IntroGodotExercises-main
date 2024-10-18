extends StaticBody2D

# Pixels per second
const SPEED = 300

# Typically better for physics, uses a fixed
# delta.
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		position += Vector2.RIGHT * SPEED * delta
	if Input.is_action_pressed("left"):
		position += Vector2.LEFT * SPEED * delta
