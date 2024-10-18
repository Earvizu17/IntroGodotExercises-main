extends StaticBody2D

const INITIAL_VELOCITY = Vector2(400, 400)

var velocity = INITIAL_VELOCITY


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())
