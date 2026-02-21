extends Control

var fps_label: Label

func _ready():
	# Assuming you have a Label node named "fps_label" in your scene
	fps_label = $Label

func _process(delta):
	# Calculate frames per second
	var fps = Performance.get_monitor(Performance.Monitor.TIME_FPS)
	
	# Update the text of the FPS label
	fps_label.text = "FPS: " + str(fps)
