extends Node2D

signal brick_destroyed

@export var brick_scene: PackedScene
@export var brick_margin := Vector2(100, 100)
@export var brick_vertical_range := 100
@export var brick_count := Vector2.ONE


func _ready() -> void:
	_update_bricks()


func _update_bricks():
	var position_difference = Vector2(
		(get_window().size.x - 2 * brick_margin.x) / (brick_count.x - 1),
		brick_vertical_range / (brick_count.y - 1)
	)
	
	for brick_column_index in range(brick_count.x):
		for brick_row_index in range(brick_count.y):
			var brick = brick_scene.instantiate()
			brick.position = Vector2(
				brick_margin.x + brick_column_index * position_difference.x,
				brick_margin.y + brick_row_index * position_difference.y
			)
			brick.add_to_group("bricks")
			brick.connect("destroyed", _on_brick_destroyed)
			add_child(brick)


func _on_brick_destroyed():
	emit_signal("brick_destroyed")
