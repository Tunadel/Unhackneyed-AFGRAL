extends HSlider

var volume
var volume_mute = false
var volume_reduct = 90
var volume_divider = 0.6

func _input(event):
	if get_tree().is_paused():
		if has_focus():
			if Input.is_action_just_pressed("ui_right"):
				var x = self.get_value()
				self.set_value(x+10)
			elif Input.is_action_just_pressed("ui_left"):
				var x = get_node("HSlider").get_value()
				self.set_value(x-10)

func _on_HSlider_value_changed( value ):
	if volume_mute == false:
		volume = self.get_value()
		volume -= volume_reduct
		volume = volume * volume_divider
		AudioServer.set_bus_volume_db(0 , volume)
	pass # replace with function body