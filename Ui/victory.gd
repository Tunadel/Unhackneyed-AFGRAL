extends Control

var language = "english"
var text = []
var control = preload("res://Ui/Event_Select.gd").new()
var load_saver = preload("res://systems/Save.gd").new()

func _ready():
	load_Stats()
	load_lingo()
	pass # Replace with function body.


func _on_Language_toggled(button_pressed):
	language = "french"
	load_Stats()
	load_lingo()
	pass # Replace with function body.

func load_Stats():
	load_saver.loader()
	match language:
		"english":
			text = get_node("Languages").english
		"french":
			text = get_node("Languages").french
		"portuguese":
			text = get_node("Languages").portuguese

func load_lingo():
	get_node("Label").set_text(str(text["Ending"]))

func _on_Language4_button_down():
	language = "portuguese"
	load_Stats()
	load_lingo()
	pass # Replace with function body.

func _on_Language3_button_down():
	language = "english"
	load_Stats()
	load_lingo()
	pass # Replace with function body.

func _on_Language2_button_down():
	language = "french"
	load_Stats()
	load_lingo()
	pass # Replace with function body.
