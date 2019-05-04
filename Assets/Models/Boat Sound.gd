extends AudioStreamPlayer

var speed = 0
var transition = 0.015
var event = false

func _process(delta):
	if Input.is_action_pressed("ui_left_mouse"):
		speed = get_parent().get_node("Mouse Follow").speed_forward
		speed = (speed)-80
		print(speed)
		AudioServer.set_bus_volume_db(0 ,speed)