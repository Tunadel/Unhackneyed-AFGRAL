extends PathFollow

export var speed = 0

func _process(delta):
	set_offset(get_offset()+delta*1)
	pass
