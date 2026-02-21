extends Node2D

@export var player: Node2D
@export var audio_player: AudioStreamPlayer2D
@export var max_distance: float = 200.0

func _process(delta):
	if player and audio_player:
		var distance = player.global_position.distance_to(audio_player.global_position)
		
		if distance <= max_distance:
			if not audio_player.playing:
				audio_player.play()
		else:
			if audio_player.playing:
				audio_player.stop()
