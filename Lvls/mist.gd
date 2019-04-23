extends CSGMesh

var value = 1
var Mat

# Called when the node enters the scene tree for the first time.
func _ready():
	Mat = get_mesh().get_material()
	Mat.set_shader_param("my_value",value)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
