extends Button

@export_file var scene_to_load: String


func _ready() -> void:
	pressed.connect(_on_pressed)


func _on_pressed():
	get_tree().change_scene_to_file(scene_to_load)
