extends CharacterBody2D

# Pixels per second
const SPEED = 128
const DAMAGE = 2
const KNOCKBACK = 256

@onready var animation_tree: AnimationTree = $AnimationTree


func _physics_process(_delta: float) -> void:
	var move_direction = Input.get_vector("left", "right", "up", "down")
	velocity = SPEED * move_direction
	animation_tree["parameters/conditions/running"] = (velocity.length() != 0)
	
	move_and_slide()


func _process(_delta: float) -> void:
	if velocity.x != 0:
		var facing_left = velocity.x < 0
		$Sprite.flip_h = facing_left
		$AttackOrigin.rotation = PI if (facing_left) else 0.0
	
	animation_tree[
		"parameters/conditions/attack"
	] = Input.is_action_just_pressed("action")


func _on_attack_area_body_entered(body: Node2D) -> void:
	var attack_impulse = (
		body.global_position - $AttackOrigin.global_position
	).normalized() * KNOCKBACK
	body.on_attacked(DAMAGE, attack_impulse)
