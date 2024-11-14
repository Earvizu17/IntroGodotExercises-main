extends CanvasLayer


func on_player_inside_updated(player_inside: bool) -> void:
	$Margin/InteractionLabel.visible = player_inside
