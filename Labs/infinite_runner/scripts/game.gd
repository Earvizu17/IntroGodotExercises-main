extends Node2D

@export var main_track: AudioStream


func _ready() -> void:
	Music.require_track("runner_main", main_track)
	Music.play_track("runner_main")


func _on_ground_spawner_player_hit() -> void:
	$InfinitePlayer.on_crash()
