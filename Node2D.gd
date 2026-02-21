extends Node2D

@export var bounce_multiplier: float = 2.0

func _ready():
	$Area2D.body_entered.connect(on_body_entered)

func on_body_entered(body):
	if body is CharacterBody2D:
		# Bounce with a force based on the character's jump velocity
		body.velocity.y = body.JUMP_VELOCITY * bounce_multiplier
