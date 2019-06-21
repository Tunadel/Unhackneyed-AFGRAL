extends Sprite

var rot

func _process(delta):
	var parent = get_parent().get_parent().get_parent().get_parent()
	rot = parent.get_translation().angle_to(parent.objectve)
#	print(rot)
	set_rotation(rot - 3.14)
	pass