extends Area2D

signal collected


func _ready() -> void:
	body_entered.connect(_on_player_collision)
	$Animation.play("idle")


func _on_player_collision(_body: Node2D) -> void:
	# Stop detecting collisions
	set_deferred("monitoring", false)
	$Animation.play("collect")
	collected.emit()
	$Animation.animation_finished.connect(_on_collection_animation_finished)


func _on_collection_animation_finished(_anim_name: String) -> void:
	queue_free()
