extends CSGMesh

var speed = 0
var transition = 0.015
var event = false

func _process(delta):
	if Input.is_action_pressed("ui_right_mouse"):
		speed = get_parent().get_node("Mouse Follow").speed_forward
		set_scale(Vector3(speed * 0.15,1,1))
		set_translation(Vector3(0,-0.75,speed * 0.05)) 
	else:
		set_scale(Vector3(0,1,1))
		set_translation(Vector3(0,-0.5,0))