extends Control

var load_saver = preload("res://systems/Save.gd").new()
var text = []
export var Card1 = ""
export var Card2 = ""
export var Card3 = ""
export var Title = ""
var event

func _ready():
	event_selector(0)


func event_selector(var i):
	load_Stats()
	event = text.all
	$Control/Card/Label.set_text(event[i][0])
	$Control/Card2/Label.set_text(event[i][1])
	$Control/Card3/Label.set_text(event[i][2])
	$Label.set_text(event[i][3])

func save_Stats():
	load_saver.data_save = text
	load_saver.save(text)

func load_Stats():
	load_saver.loader()
	text = load_saver.data_load
	print(text)

func get_Stats():
	text = [
	Card1,
	Card2,
	Card3,
	Title
	]

func _on_Button_button_down():
	pass # Replace with function body.

func _on_Button2_button_down():
	pass # Replace with function body.

func _on_Button3_button_down():
	pass # Replace with function body.