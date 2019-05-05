extends TextureButton

export var level = ""

func _on_Button_button_down():
	print(level)
	get_tree().change_scene(level)
	pass # Replace with function body.
