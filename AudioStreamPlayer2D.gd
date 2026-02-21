extends Control

var settings_menu: PopupPanel
var output_device_dropdown: OptionButton
var os = OS

func _ready():
	settings_menu = $PopupPanel
	output_device_dropdown = $OptionButton

	# Populate dropdown menu with available audio output devices
	var devices = os.get_audio_output_devices()
	for device in devices:
		output_device_dropdown.add_item(device)

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		toggle_settings_menu()

func toggle_settings_menu():
	if settings_menu.visible:
		settings_menu.hide()
	else:
		settings_menu.show()

func _on_OutputDeviceDropdown_item_selected(index):
	# Retrieve selected output device from dropdown menu
	var selected_device = output_device_dropdown.get_item_text(index)
	
	# Set the selected output device
	os.set_audio_output_device(selected_device)

