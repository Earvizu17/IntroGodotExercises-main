extends Area2D

signal player_hit


func _on_body_entered(_body: Node2D) -> void:
	player_hit.emit()
