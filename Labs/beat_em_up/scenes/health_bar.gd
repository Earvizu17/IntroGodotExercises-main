extends ProgressBar

@export var health_gradient: Gradient


var max_health := 1 : set = update_max_health
var health := 1 : set = update_health


func update_max_health(new_max: int) -> void:
	max_health = new_max
	max_value = max_health


func update_health(new_value: int) -> void:
	health = new_value
	value = health
	
	var fill_style = get_theme_stylebox("fill")
	fill_style.bg_color = health_gradient.sample(float(health) / max_health)
