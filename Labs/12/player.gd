extends CharacterBody3D

# meters per second
@export var speed: float = 10.0

# radians per pixel
@export_range(0.0005, 0.02) var mouse_sensitivity: float = 0.008

var move_input := Vector2.ZERO


func _ready() -> void:
	CursorController.capture_mouse()


func _unhandled_input(event: InputEvent) -> void:
	if (
		event.is_action("right") or event.is_action("left")
		or event.is_action("up") or event.is_action("down")
	):
		move_input = Input.get_vector("left", "right", "down", "up")
	
	elif event is InputEventMouseMotion:
		var look_rotation = event.screen_relative * mouse_sensitivity
		rotate(Vector3.UP, -look_rotation.x)
		$Camera.rotate(Vector3.RIGHT, -look_rotation.y)


func _physics_process(_delta: float) -> void:
	var forward = -transform.basis.z
	var right = transform.basis.x

	velocity = (
		forward * move_input.y + right * move_input.x
	).normalized() * speed
	move_and_slide()
