extends Node2D

export var motion = 0.0
export var speed_forward = 0.0
export var maximun_speed_forward = 0.0
export var desaleration = 0.0
var vizualization = 0.0
var state = 0.0
var vizualization_show = 0.0

func _process(delta):
	vizualization = vizualization_show
	vizualization_show = lerp(vizualization_show, state, 0.1)
	get_parent().get_node("CSGMesh").get_mesh().get_material().set_shader_param("vizualization",vizualization_show)
	
	if Input.is_action_pressed("ui_left_mouse"):
		if motion > -maximun_speed_forward:
			motion -= speed_forward
			state = 1
			get_parent().get_node("Smoke/Particles").emitting = true
	else:
		motion *= desaleration
		state = 0
		get_parent().get_node("Smoke/Particles").emitting = false
	get_parent().get_parent().translate(Vector3(0,0,-delta * motion))
	
		
