extends AnimationPlayer

func _input(event):
	if Input.is_action_pressed("ui_left_mouse"):
		self.advance(12)
	