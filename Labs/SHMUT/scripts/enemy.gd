extends CharacterBody2D

signal destroyed

# Pixels per second
const SPEED = 64


func _ready() -> void:
	velocity = Vector2.DOWN * SPEED


func _physics_process(_delta: float) -> void:
	move_and_slide()


func destroy():
	emit_signal("destroyed")
	queue_free()
