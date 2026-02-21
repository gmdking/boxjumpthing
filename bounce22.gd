extends Node2D

@export var bounce_multiplier: float = 1.0

func _ready():
	$bounce22.body_entered.connect(on_body_entered)

func on_body_entered(body):
	if body is CharacterBody2D:
		body.velocity.y = body.JUMP_VELOCITY * bounce_multiplier
