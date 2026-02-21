extends Node2D

var settings_menu_visible = false

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		print("Escape key pressed")
		toggle_settings_menu()

func toggle_settings_menu():
	if settings_menu_visible:
		hide_settings_menu()
	else:
		show_settings_menu()

func hide_settings_menu():
	settings_menu_visible = false
	print("Settings menu hidden")
	# Additional logic to hide the settings menu GUI
	print("Settings menu visible: ", settings_menu_visible)

func show_settings_menu():
	settings_menu_visible = true
	print("Settings menu shown")
	# Additional logic to show the settings menu GUI
	print("Settings menu visible: ", settings_menu_visible)
