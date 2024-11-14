extends Area3D

signal player_inside_updated


var player_inside := false : set = _set_player_inside


func _set_player_inside(new_player_inside: bool) -> void:
	player_inside = new_player_inside
	player_inside_updated.emit(new_player_inside)
	$FloatyLabel.visible = new_player_inside


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and player_inside:
		$Audio.play()


func _on_body_entered(body: Node3D) -> void:
	player_inside = true


func _on_body_exited(body: Node3D) -> void:
	player_inside = false
