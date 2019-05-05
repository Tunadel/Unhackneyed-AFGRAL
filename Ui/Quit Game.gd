extends TextureButton

func _on_Quit_Game_button_down():
	get_tree().quit()
	pass # Replace with function body.


func _on_Quit_Game_mouse_entered():
	set_scale(Vector2(1.25,1.25))
	pass # Replace with function body.


func _on_Quit_Game_mouse_exited():
	set_scale(Vector2(1,1))
	pass # Replace with function body.
