extends Node2D

signal player_hit

const GROUND_Y_POSTIION = 0

@onready var spawn_distance := get_viewport_rect().size.x / 2

@export var ground: PackedScene
@export var player: Node2D
@export var spacing: int = 300

var last_spawned_position := 0


func _physics_process(_delta) -> void:
	var player_visibility := player.position.x + spawn_distance
	var potential_spawn_x_position = last_spawned_position + spacing
	
	if potential_spawn_x_position < player_visibility:
		_spawn_platform(potential_spawn_x_position)


func _spawn_platform(x_position) -> void:
	var platform = ground.instantiate()
	platform.position.x = x_position
	platform.position.y = GROUND_Y_POSTIION
	platform.player_hit.connect(_on_ground_player_hit)
	add_child(platform)
	
	last_spawned_position = x_position


func _on_ground_player_hit() -> void:
	player_hit.emit()
