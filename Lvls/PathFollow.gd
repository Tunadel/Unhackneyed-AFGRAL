extends PathFollow

func _process(delta):
	set_offset(get_offset()+delta)
	pass
