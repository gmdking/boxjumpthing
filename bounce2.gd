extends Area2D

@export var slam_force: float = 1500.0

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

func get_player():
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body is CharacterBody2D:
			return body
	return null

func _process(delta):
	if player_in_orb:
		var player = get_player()
		if player and Input.is_action_just_pressed("jump"):
			player.velocity.y = slam_force

func _input(event):
	if event.is_action_pressed("jump"):
		if $Area2D.overlapping_bodies.has(CharacterBody2D):
			$Area2D.overlapping_bodies[CharacterBody2D].has_hit_orb = true

