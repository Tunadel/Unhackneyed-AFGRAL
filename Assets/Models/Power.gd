extends Polygon2D

var speed = 0
var transition = 0.015

func _process(delta):
	if Input.is_action_pressed("ui_left_mouse"):
		speed = get_parent().get_node("Mouse Follow").speed_forward
		set_scale(Vector2(1,-speed * 0.1))
		set_color(Color(0+ speed * transition,1-speed * transition,0))
	else:
		set_scale(Vector2(1,0))
