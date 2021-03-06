extends Control

var load_saver = preload("res://systems/Save.gd").new()
var text = []
export var Card1 = ""
export var Card2 = ""
export var Card3 = ""
export var Title = ""
var event 
var consequence
var cunrret
var gameover = preload("res://game_over.gd").new()
var language = "english"
var button = 0
var game_over = false

func _ready():
	self.hide()
	load_Stats()

func event(var i):
	get_parent().get_node("Mouse Follow").set_process(false)
	get_parent().get_node("Timer").start()
	get_node("Control").show()
	get_node("Consequence").hide()
	self.show()
	event_selector(i)

func event_selector(var i):
	event = text.all
	$Control/Card/Label.set_text(event[i][0])
	$Control/Card2/Label.set_text(event[i][1])
	$Control/Card3/Label.set_text(event[i][2])
	$Label.set_text(event[i][3])
	$Control/Card/Sprite1.set_texture(load("res://Ui/Events Cards Assets-20190822T024226Z-001/Events Cards Assets/"+str(i+1)+"-I.png"))
	$Control/Card2/Sprite2.set_texture(load("res://Ui/Events Cards Assets-20190822T024226Z-001/Events Cards Assets/"+str(i+1)+"-II.png"))
	$Control/Card3/Sprite3.set_texture(load("res://Ui/Events Cards Assets-20190822T024226Z-001/Events Cards Assets/"+str(i+1)+"-III.png"))
	$AudioStreamPlayer.stream = load("res://Voice Acting Ogg/voice "+str(i+1)+".ogg")
	$AudioStreamPlayer._set_playing(true)
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
		"portuguese":
			text = get_node("Languages").portuguese

func get_Stats():
	text = [
	Card1,
	Card2,
	Card3,
	Title
	]

func _on_Button_button_down():
	cosequence(1)
	action(cunrret,1)
	pass # Replace with function body.

func _on_Button2_button_down():
	cosequence(2)
	action(cunrret,2)
	pass # Replace with function body.

func _on_Button3_button_down():
	cosequence(3)
	action(cunrret,3)
	pass # Replace with function body.
#	get_tree().set_pause(false)

var current_consequence = 0

func cosequence(var b):
	audio_response(cunrret, b)
	current_consequence  = b
	consequence = text.cosequence
	get_node("Consequence/Card/Label").set_text(consequence[cunrret][b-1])

func refuge(var c = 0):
	var r = int(get_parent().get_parent().get_node("CanvasLayer/Passagenrs/Number").get_text())
	r += c
	get_parent().get_parent().get_node("CanvasLayer/Passagenrs/Number").set_text(str(r))
	get_node("Consequence/Card/Label2").set_text("you lost: " + str(c))
	

func _on_Language_button_down():
	language = "french"
	load_Stats()
	event_selector(cunrret)
	cosequence(current_consequence)
	pass # Replace with function body.
	
func _on_Language2_button_down():
	language = "english"
	load_Stats()
	event_selector(cunrret)
	cosequence(current_consequence)
	pass # Replace with function body.

func _on_Language3_button_down():
	language = "portuguese"
	load_Stats()
	event_selector(cunrret)
	cosequence(current_consequence)
	pass # Replace with function body.

func _on_Button4_button_down():
	self.hide()
	$AudioStreamPlayer._set_playing(false)
	get_tree().set_pause(false)
	if game_over:
		get_tree().change_scene("res://Ui/Game OVer.tscn")
	pass # Replace with function body.

func medkit(var boolean):
	if boolean:
		get_parent().get_node("medikit").show()
		get_node("Consequence/Card/Label2").set_text("you received a medkit")
	else:
		get_parent().get_node("medikit").hide()

func action(var a,var b):
	audio_response(a,b)
	$Label.set_text(event[cunrret][b-1])
	match a:
		0:
			match b:
				1:
					refuge(0)
				2:
					refuge(-5)
				3:
					refuge(-10)
		1:
			match b:
				1:
					refuge(0)
				2:
					refuge(-1)
				3:
					refuge(0)
		2:
			match b:
				1:
					refuge(-1)
				2: 
					refuge(-15)
				3:
					refuge(0)
		3:
			match b:
				1:
					refuge(0)
				2:
					refuge(-10)
				3:
					game_over()
					
		4:
			match b:
				1:
					game_over()
				2:
					refuge(0)
				3:
					refuge(0)
		5: 
			match b:
				1:
					refuge(0)
					medkit(true)
				2:
					refuge(0)
				3:
					refuge(-5)
		6:
			match b:
				1:
					refuge(15)
					get_node("Consequence/Card/Label2").set_text("you gained 15 refuges")
				2:
					refuge(30)
					get_node("Consequence/Card/Label2").set_text("you gained 30 refuges")
				3:
					refuge(0)
		7:
			match b:
				1:
					refuge(-30)
				2:
					game_over()
				3:
					refuge(-10)
		8:
			match b:
				1:
					refuge(-10)
				2:
					if get_parent().get_node("medikit").is_visible():
						refuge(0)
						get_parent().get_node("medikit").set_visible(false)
					else:
						get_node("Consequence/Card/Label2").set_text("you don't have medkit")
						$AudioStreamPlayer2.set_stream(load("res://sound/sfx-ogg/Coughs_Combined.ogg"))
						$AudioStreamPlayer2._set_playing(true) 
						$Timer.start()
				3:
					$Timer.start()
					refuge(0)
					$AudioStreamPlayer2.set_stream(load("res://sound/sfx-ogg/Coughs_Combined.ogg"))
					$AudioStreamPlayer2._set_playing(true) 
		10:
			match b:
				1:
					refuge(-25)
				2:
					refuge(0)
				3:
					refuge(-10)
		11:
			match b :
				1:
					refuge(0)
				2:
					refuge(-30)
				3:
					refuge(-50)
		13:
			match b:
				1:
					refuge(-10)
				2:
					game_over()
				3:
					refuge(-30)
	get_node("Control").hide()
	get_node("Consequence").show()

func game_over():
	get_node("Consequence/Card/Label2").set_text("you lost the boat")
	game_over = true

func audio_response(var a,var b):
	match b:
		1:
			$AudioStreamPlayer.stream = load("res://Voice Acting Ogg/voice "+str(a+1)+" I.ogg")
		2:
			$AudioStreamPlayer.stream = load("res://Voice Acting Ogg/voice "+str(a+1)+" II.ogg")
		3:
			$AudioStreamPlayer.stream = load("res://Voice Acting Ogg/voice "+str(a+1)+" III.ogg")
	$AudioStreamPlayer._set_playing(true)

func _on_Timer_timeout():
	var r = int(get_parent().get_parent().get_node("CanvasLayer/Passagenrs/Number").get_text())
	r -= 1
	get_parent().get_parent().get_node("CanvasLayer/Passagenrs/Number").set_text(str(r))
	pass # Replace with function body.
