extends StaticBody2D

signal player_hit


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_box_player_hit() -> void:
	player_hit.emit()
