extends Area2D

@export var jump_boost: float = 1.5

const JUMP_VELOCITY = -600.0
var player_in_orb = false

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body is CharacterBody2D:
		player_in_orb = true

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
