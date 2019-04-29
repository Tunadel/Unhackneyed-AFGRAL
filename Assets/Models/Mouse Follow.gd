extends Node2D

export var motion = 0.0
export var speed_forward = 0.0
export var maximun_speed_forward = 0.0
export var desaleration = 0.0


func _process(delta):
	if Input.is_action_pressed("ui_left_mouse"):
		if motion > -maximun_speed_forward:
			motion -= speed_forward
			get_parent().get_node("CSGMesh").show()
	else:
		motion *= desaleration
		get_parent().get_node("CSGMesh").hide()
	get_parent().get_parent().translate(Vector3(0,0,-delta * motion))
		
