extends RayCast

export var group = []
var i = 0

func _process(delta):
	if is_colliding():
		for i in group.size()-1:
			if get_collider().is_in_group(group[i]):
				play_event(i)
	
func play_event(event):
	match event:
		0:
			print("bridge")
