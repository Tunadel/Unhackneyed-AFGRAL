extends Sprite3D

var angle = 0
var rotatio = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		rotatio = get_parent().get_parent().get_node("Camera Movment").rotatio
		angle = self.get_rotation().y
		self.rotate_y((rotatio - angle + 1.57))