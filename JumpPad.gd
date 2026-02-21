extends Node2D

@export var bounce_multiplier: float = 2.0

const JUMP_VELOCITY = -600.0

func _ready():
	var bounce_area = $bounce
	if bounce_area:
		bounce_area.connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body is CharacterBody2D:
		var final_bounce_multiplier = bounce_multiplier
		if body.extra_bounce != null:
			final_bounce_multiplier *= body.extra_bounce
		body.velocity.y = JUMP_VELOCITY * final_bounce_multiplier
