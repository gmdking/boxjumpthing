extends Area2D

@export var target_node_path: NodePath  # Export the target node path for the editor

func _ready():
	self.body_entered.connect(Callable(self, "_on_body_entered"))
	print("Signal connected. Target node path:", target_node_path)

func _on_body_entered(body):
	print("Body entered:", body)
	if body is CharacterBody2D:
		var target_node = get_node("/root/World/Area2D10")
		if target_node:
			var target_position = target_node.position
			print("Teleporting body to:", target_position)
			body.position = target_position
		else:
			print("Target node not found.")
