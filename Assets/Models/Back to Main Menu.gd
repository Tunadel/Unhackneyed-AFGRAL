extends TextureButton

func _ready():
	get_tree().set_pause(false)

func _on_Back_to_Main_Menu_button_down():
	get_tree().change_scene("res://Ui/Main_menu_alt.tscn")
	pass # Replace with function body.
