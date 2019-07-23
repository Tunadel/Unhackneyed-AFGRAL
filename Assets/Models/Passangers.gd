extends Spatial


func _process(delta):
	for i in get_child_count():
		print(i)
		if i >= ((get_parent().get_parent().get_node("CanvasLayer/Passagenrs").number) * 0.1):
			get_node("Sprite3D" + str(i+1)).set_visible(false)
#	pass
