extends Node2D

var dict = "res://save.json"
var file = File.new()
var current_level
var coins = 0
var event = []
var data_load = {}
var data_save = {}

func _ready():
	print(get_tree().get_current_scene().get_filename())
	current_level = get_tree().get_current_scene().get_filename()
	save(event)

func loader():
	if file.open(dict, File.READ) !=0:
		print ("error open")
		return
	if not file.file_exists(dict):
		print("erro_exist")
	data_load = parse_json(file.get_as_text())

#saves data
func save(event):
	if file.open(dict, File.WRITE) !=0:
		print("erro_write")
		return
	data_save = { "event" : event}
	file.store_line(to_json(data_save))
	file.close()
#changes coreboard text
