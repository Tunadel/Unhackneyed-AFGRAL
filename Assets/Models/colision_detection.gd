extends RayCast

export var group = []
var i = 0
var event2 = true
var object
var a = 0
func _process(delta):
	if is_colliding():
		for i in group.size()-1:
			if get_collider().is_in_group(group[i]):
				print(group[i])
#				get_parent().get_node("Mouse Follow").event = false
				get_parent().get_parent().get_node("Control").event(i)
				play_event(i)
				get_collider().get_child(0).set_disabled(true) 

	
func play_event(event):
	event_enabler(true)
	get_parent().get_parent().get_node("Control").show()

func event_enabler(var boolean):
	get_tree().set_pause(boolean)

