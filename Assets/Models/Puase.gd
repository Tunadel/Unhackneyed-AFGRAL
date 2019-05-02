extends Control

func _ready():
	get_tree().set_pause(false)
	self.hide()

func _input(event):
	if event.is_action_pressed("ui_pause") && !event.is_echo():
		pause()
	pass

func pause():
	get_tree().set_pause(!get_tree().is_paused())
	if get_tree().is_paused():
		self.show()
	else:
		self.hide()
func _on_Button_button_down():
	pause()
	pass # Replace with function body.