extends Node2D

export var motion = 0.0
export var speed_forward = 0.0
export var maximun_speed_forward = 0.0
export var desaleration = 0.0
var vizualization = 0.0
var state = 0.0
var vizualization_show = 0.0
var water_level = 1.05

func _process(delta):
	if motion > 0:
		vizualization_show = motion * 0.5
	else:
		vizualization_show = motion * -0.5
	
	get_parent().get_node("CSGMesh").get_mesh().get_material().set_shader_param("vizualization",vizualization_show)
	
	speed_forward = (get_position().distance_to(get_global_mouse_position())) * 0.1
	
	if get_parent().get_parent().move_and_collide(Vector3(0,0,0)):
		motion = motion * -0.1
	
	if Input.is_action_just_pressed("ui_left_mouse"):
		Input. warp_mouse_position(Vector2(OS.get_window_size().x/2,OS.get_window_size().y/2))
	
	if Input.is_action_just_released("ui_left_mouse"):
		if motion < maximun_speed_forward:
			motion += speed_forward
			state = 1
	else:
		motion *= desaleration
		state = 0
		get_parent().get_parent().translate(Vector3(0,0,-delta * motion))
		
	if get_parent().get_parent().get_translation().y > water_level or get_parent().get_parent().get_translation().y < water_level:
		get_parent().get_parent().set_translation(Vector3(get_parent().get_parent().get_translation().x,water_level,get_parent().get_parent().get_translation().z))