extends Node2D

@export var body: CharacterBody2D

@export var x_stretch_curve: Curve
@export var y_stretch_curve: Curve
@export var max_scale_offset: float = 0.15
@export var max_stretch_velocity: float = 600.0


func _process(_delta: float) -> void:
	var velocity_factor := body.velocity.y / max_stretch_velocity
	var adjusted_velocity_factor = inverse_lerp(-1.0, 1.0, velocity_factor)
	
	print("Vel " + str(adjusted_velocity_factor))
	var stretch_factor := Vector2(
		x_stretch_curve.sample(adjusted_velocity_factor),
		y_stretch_curve.sample(adjusted_velocity_factor)
	)
	print("Str: " + str(stretch_factor))
	
	scale = Vector2.ONE + (stretch_factor * max_scale_offset)
	print("Scale: " + str(scale))
