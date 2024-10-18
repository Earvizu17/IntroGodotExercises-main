extends Node

@export var level_select: PackedScene
@export var max_score: int = 5

var score = 0


func _ready() -> void:
	$UI/Margin/Coins.max_score = max_score


func on_coin_collected():
	score += 1
	$UI/Margin/Coins.score = score
	_check_for_win_condition()


func _check_for_win_condition():
	if score == max_score:
		_win_level()


func _win_level():
	get_tree().call_deferred("change_scene_to_packed", level_select)
