extends CharacterBody2D

const ACCELERATION = 1200.0
const DECELERATION = 1600.0
const MAX_SPEED = 600.0
const JUMP_VELOCITY = -600.0
const FRAME_SWITCH_TIME = 4

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var frame_counter = 0
var current_sprite_index = 0
var sprites = []

func _ready():
	sprites = [
		$sprite_0,
		$sprite_1,
		$sprite_2
	]
	update_sprite_visibility()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = 0
	if Input.is_action_pressed("move_left"):
		direction -= 1
	if Input.is_action_pressed("move_right"):
		direction += 1

	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * MAX_SPEED, ACCELERATION * delta)
		for sprite in sprites:
			sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, DECELERATION * delta)

	move_and_slide()

	if velocity.x != 0:
		frame_counter += 1
		if frame_counter >= FRAME_SWITCH_TIME:
			frame_counter = 0
			current_sprite_index = (current_sprite_index % 2) + 1
	else:
		current_sprite_index = 0

	update_sprite_visibility()

func update_sprite_visibility():
	for i in range(sprites.size()):
		sprites[i].visible = (i == current_sprite_index)


func _on_bounce_3_body_entered(body):
	pass # Replace with function body.


func _on_bounce_3_body_exited(body):
	pass # Replace with function body.


func _on_bounce_22_body_entered(body):
	pass # Replace with function body.


func _on_bounce_22_body_exited(body):
	pass # Replace with function body.
