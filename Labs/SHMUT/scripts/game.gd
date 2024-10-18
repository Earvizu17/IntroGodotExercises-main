extends Node2D

var score = 0


func _on_enemy_spawner_enemy_destroyed() -> void:
	score += 1
	$UI.set_score(score)
