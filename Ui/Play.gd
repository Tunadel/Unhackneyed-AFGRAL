extends TextureButton

export var level = ""

func _on_Button_button_down():
	print(level)
	get_tree().change_scene(level)
	pass # Replace with function body.

func _on_Play_mouse_entered():
	set_scale(Vector2(1.25,1.25))
	pass # Replace with function body.

func _on_Play_mouse_exited():
	set_scale(Vector2(1,1))
	pass # Replace with function body.
