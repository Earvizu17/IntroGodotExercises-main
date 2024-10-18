extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -600.0
const DECELERATION_FRAMES = 5

var within_edge_grace_period = true

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		if $EdgeGrace.is_stopped():
			$EdgeGrace.start()
	else:
		$EdgeGrace.stop()
		within_edge_grace_period = true

# I've used "action" instead of "jump" since this project really
# contains multiple games.
	if Input.is_action_just_pressed("action") and _can_jump():
		velocity.y = JUMP_VELOCITY
		within_edge_grace_period = false
	
	# Allow controllable jump height.
	if Input.is_action_just_released("action"):
		velocity.y *= 0.5

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		$Sprite.play("run")
		$Sprite.flip_h = direction > 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED / DECELERATION_FRAMES)
		$Sprite.play("idle")
	
	move_and_slide()

# Player can jump if they are on the floor, have just fallen off a ledge in the
# past 0.15 seconds, or are 8 pixels or less from the ground.
func _can_jump() -> bool:
	return (
		is_on_floor() or within_edge_grace_period or $EarlyGrace.is_colliding()
	)

func _on_edge_grace_timeout() -> void:
	within_edge_grace_period = false
