extends Node
func _ready():
	DiscordRPC.app_id = 1247365783567208468
	DiscordRPC.details = "By GMD King"
	DiscordRPC.state = "Jumping."
	DiscordRPC.large_image = "guyforgamediscordrp"
	DiscordRPC.large_image_text = "Don't talk to me or my son ever again."
	DiscordRPC.small_image = "guyforgamediscordrp"
	DiscordRPC.small_image_text = "I'm his son."

	DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system()) # "02:46 elapsed"

	DiscordRPC.refresh() # Always refresh after changing the values!
