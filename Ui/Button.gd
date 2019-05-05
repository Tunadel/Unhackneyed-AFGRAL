extends Button

func _on_Button_mouse_entered():
	get_parent().set_scale(Vector2(1.15,1.15))
	pass # Replace with function body.

func _on_Button_mouse_exited():
	get_parent().set_scale(Vector2(1,1))
	pass # Replace with function body.
