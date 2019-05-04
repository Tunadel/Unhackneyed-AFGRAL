extends Control

var load_saver = preload("res://systems/Save.gd").new()
var text = []
export var Card1 = ""
export var Card2 = ""
export var Card3 = ""
export var Title = ""
var event 
var cunrret
var gameover = preload("res://game_over.gd").new()
var language = "english"

func _ready():
	self.hide()

func event(var i):
	self.show()
	event_selector(i)

func event_selector(var i):
	load_Stats()
	event = text.all
	$Control/Card/Label.set_text(event[i][0])
	$Control/Card2/Label.set_text(event[i][1])
	$Control/Card3/Label.set_text(event[i][2])
	$Label.set_text(event[i][3])
	cunrret = i

func save_Stats():
	load_saver.data_save = text
	load_saver.save(text)

func load_Stats():
	load_saver.loader()
	match language:
		"english":
			text = get_node("Languages").english
		"french":
			text = get_node("Languages").french

func get_Stats():
	text = [
	Card1,
	Card2,
	Card3,
	Title
	]

func _on_Button_button_down():
	action(cunrret,1)
	pass # Replace with function body.

func _on_Button2_button_down():
	action(cunrret,2)
	pass # Replace with function body.

func _on_Button3_button_down():
	action(cunrret,3)
	pass # Replace with function body.

func action(var a,var b):
	match a:
		0:
			match b:
				2:
					refuge(-5)
				3:
					refuge(-10)
		1:
			match b:
				2:
					refuge(-1)
		2:
			match b:
				1:
					refuge(-1)
				2: 
					refuge(-15)
		3:
			match b:
				2:
					refuge(-10)
				3:
					get_tree().change_scene("res://Ui/Game OVer.tscn")
		4:
			match b:
				1:
					get_tree().change_scene("res://Ui/Game OVer.tscn")
		5: 
			match b:
				3:
					refuge(-5)
		6:
			match b:
				1:
					refuge(15)
				2:
					refuge(30)
		7:
			match b:
				1:
					refuge(-30)
				2:
					get_tree().change_scene("res://Ui/Game OVer.tscn")
				3:
					refuge(-10)
		8:
			match b:
				1:
					refuge(-10)
		10:
			match b:
				1:
					refuge(-25)
				3:
					refuge(-10)
#		11:
#			match b:
#				1:
#					get_tree().change_scene("res://Ui/Game OVer.tscn")
#				3:
#					refuge(-20)
		11:
			match b :
				2:
					refuge(-30)
				3:
					refuge(-50)
		13:
			match b:
				1:
					refuge(-10)
				2:
					get_tree().change_scene("res://Ui/Game OVer.tscn")
				3:
					refuge(-30)

	self.hide()
	get_tree().set_pause(false)

func refuge(var c):
	var r = int(get_parent().get_parent().get_node("CanvasLayer/Passagenrs/Number").get_text())
	r += c
	get_parent().get_parent().get_node("CanvasLayer/Passagenrs/Number").set_text(str(r))

func _on_Language_button_down():
	match language:
		"english":
			language = "french"
		"french":
			language = "english"
	event_selector(cunrret)
	pass # Replace with function body.
