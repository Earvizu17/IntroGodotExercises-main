extends Area2D


func _ready() -> void:
	body_entered.connect(_on_player_entered)


func _on_player_entered(_body: Node2D):
	get_tree().call_deferred("reload_current_scene")
