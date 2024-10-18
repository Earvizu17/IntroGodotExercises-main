extends CharacterBody2D

const INITIAL_HEALTH = 4
const FRICTION = 1.0

var health := INITIAL_HEALTH : set = update_health


func _ready() -> void:
	var health_bar = $HealthBar
	health_bar.max_health = INITIAL_HEALTH
	health_bar.health = health


func _physics_process(_delta: float) -> void:
	apply_friction()
	move_and_slide()


func apply_friction() -> void:
	velocity *= FRICTION


func take_damage(damage_amount: int, knockback: Vector2 = Vector2.ZERO) -> void:
	health -= damage_amount
	velocity += knockback


func update_health(new_health: int) -> void:
	health = new_health
	$HealthBar.health = health

	if health <= 0:
		handle_death()


func handle_death() -> void:
	queue_free()
