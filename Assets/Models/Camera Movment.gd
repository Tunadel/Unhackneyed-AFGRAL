extends Node2D

var model3d = ""
var camera = ""
var angle = 0
var rotatio = 0
var deadzone = 100
var deadzone2 = 0.9
var motio

func _ready():
	model3d = get_parent().get_parent().get_path()

func _process(delta):
	motio = 1 - get_parent().get_node("Mouse Follow").motion * 0.1
	if motio < 0:
		motio = 0
	if motio > deadzone2:
		motio = 1
	#	if Input.is_action_pressed("ui_left_mouse"):
	if (get_position().distance_to(get_global_mouse_position())) > deadzone:
		camera = get_parent().get_parent().get_node("camera").get_path()
		angle = get_node(model3d).get_rotation().y
		rotatio = self.get_angle_to(get_global_mouse_position())
		get_node(model3d).rotate_y((-rotatio - angle) * motio)
		get_node(camera).rotate_y((rotatio + angle) * motio)