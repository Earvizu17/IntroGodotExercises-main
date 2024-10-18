extends Node2D

signal enemy_destroyed

# Seconds
const SPAWN_COOLDOWN = 2.0

@export var enemy_scene: PackedScene
@export var spawnable_area := Rect2(50, 0, 1102, 0)


func _ready() -> void:
	$Timer.wait_time = SPAWN_COOLDOWN


func _on_timer_timeout() -> void:
	_spawn_enemy()


func _spawn_enemy() -> void:
	var enemy = enemy_scene.instantiate()
	enemy.position = _get_random_spawnable_position()
	enemy.connect("destroyed", _on_enemy_destroyed)
	add_child(enemy)


func _get_random_spawnable_position() -> Vector2:
	return Vector2(
		randi_range(
			spawnable_area.position.x,
			spawnable_area.position.x + spawnable_area.size.x
		),
		randi_range(
			spawnable_area.position.y,
			spawnable_area.position.y + spawnable_area.size.y
		)
	)


func _on_enemy_destroyed():
	emit_signal("enemy_destroyed")
