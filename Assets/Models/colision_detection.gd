extends RayCast

var group = ""

func _process(delta):
	if is_colliding():
		group = get_collider().get_groups()
		print(group)
		match group:
			"ice":
				print("ice")
			"earth":
				print("earth")
			"rock":
				print("rock")
			"sand":
				print("sand")
			"iceberg":
				print("iceberg")
			"tiles":
				print("tiles")
			
