extends Area2D

# Pixels per second
const SPEED = 256


func _physics_process(delta: float) -> void:
	position += Vector2.UP * SPEED * delta


func _on_body_entered(body: Node2D) -> void:
	body.destroy()
	queue_free()


func _on_visbility_notifier_screen_exited() -> void:
	queue_free()
