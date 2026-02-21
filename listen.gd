extends CharacterBody2D

const ACCELERATION = 1200.0
const DECELERATION = 800.0
const MAX_SPEED = 600.0
const JUMP_VELOCITY = -600.0
const FRAME_SWITCH_TIME = 4 # Number of frames to wait before switching sprite

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Variables for sprite animation
var frame_counter = 0
var current_sprite_index = 0
var sprites = []

func _ready():
	# Assuming you have three sprites named "sprite_0", "sprite_1", and "sprite_2" as children of the node
	sprites = [
		$sprite_0,
		$sprite_1,
		$sprite_2
	]
	# Make sure only the first sprite is visible at the start
	update_sprite_visibility()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction = 0
	if Input.is_action_pressed("move_left"):
		direction -= 1
	if Input.is_action_pressed("move_right"):
		direction += 1

	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * MAX_SPEED, ACCELERATION * delta)
		# Flip the sprite based on direction
		for sprite in sprites:
			sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, DECELERATION * delta)

	# Move the character
	move_and_slide()

	# Update sprite animation
	if velocity.x != 0:
		frame_counter += 1
		if frame_counter >= FRAME_SWITCH_TIME:
			frame_counter = 0
			current_sprite_index = (current_sprite_index % 2) + 1 # Cycle between sprite_1 and sprite_2
	else:
		current_sprite_index = 0 # Default to sprite_0 when not moving

	update_sprite_visibility()

func update_sprite_visibility():
	for i in range(sprites.size()):
		sprites[i].visible = (i == current_sprite_index)
