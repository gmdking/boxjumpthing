extends Area2D

@export var downward_force: float = 1000.0
@export var jump_boost: float = 2.5

const JUMP_VELOCITY = -600.0
var player_in_orb = false

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body is CharacterBody2D:
		player_in_orb = true
		body.velocity.y = downward_force
		body.extra_bounce = jump_boost

func _on_body_exited(body):
	if body is CharacterBody2D:
		player_in_orb = false

func _process(delta):
	if player_in_orb:
		var player = get_player()
		if player and Input.is_action_just_pressed("jump"):
			player.velocity.y = JUMP_VELOCITY * jump_boost

func get_player():
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body is CharacterBody2D:
			return body
	return null
