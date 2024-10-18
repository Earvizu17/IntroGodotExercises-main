extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_running = false
var crashed = false

func _ready() -> void:
	velocity.x = SPEED


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		_run()

	# Handle Jump.
	if Input.is_action_just_pressed("action") and is_on_floor():
		_jump()

	if not crashed:
		move_and_slide()


func on_crash():
	$Sprite.play("crash")
	$Sprite.animation_finished.connect(_on_sprite_animation_finished)
	$SoundEffects/Crash.play()
	$Reset.start()
	crashed = true


func _jump():
	velocity.y = JUMP_VELOCITY
	is_running = false
	$Sprite.play("jump")
	$SoundEffects/Jump.play()


func _run():
	if not is_running:
		$Sprite.play("run")
	is_running = true


func _on_reset_timeout() -> void:
	get_tree().reload_current_scene()


func _on_sprite_animation_finished() -> void:
	hide()
