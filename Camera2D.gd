extends Camera2D

var original_viewport_size: Vector2

func _ready():
	# Store the original viewport size
	original_viewport_size = get_viewport_rect().size

	# Connect to the viewport resized signal
	get_viewport().connect("size_changed", Callable(self, "_on_viewport_size_changed"))

func _on_viewport_size_changed():
	# Get the current viewport size
	var current_viewport_size = get_viewport_rect().size
	
	# Calculate the zoom factor based on width and height
	var zoom_factor_x = original_viewport_size.x / current_viewport_size.x
	var zoom_factor_y = original_viewport_size.y / current_viewport_size.y
	
	# Set the camera's zoom level to maintain aspect ratio
	zoom = Vector2(original_viewport_size.x, original_viewport_size.y)
