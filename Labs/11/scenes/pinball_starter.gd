extends Node3D

@export var ball_jump_magnitude: float = 5.0

@onready var ball: RigidBody3D = $PlayArea/Ball
@onready var ball_jump_impulse = -$PlayArea.transform.basis.z * ball_jump_magnitude


# I would recommend adding this functionality to the ball's script, but this is
# what the instructions asked.
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("action"):
		ball.apply_impulse(ball_jump_impulse)
