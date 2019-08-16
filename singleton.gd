extends Node

var language = ""

# Called when the node enters the scene tree for the first time.

func _input(event):
	if get_node("/root").has_node("Control"):
		language = get_node("/root/Control").language
	if get_node("/root").has_node("Main-Lvl/Boat/Spatial/Control"):
		get_node("/root/Main-Lvl/Boat/Spatial/Control").language = language
		get_node("/root/Main-Lvl/Boat/Spatial/Control").load_Stats()
	pass # Replace with function body.


