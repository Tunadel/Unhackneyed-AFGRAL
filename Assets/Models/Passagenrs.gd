extends Label

var number

func _process(delta):
	number = int(.get_node("Number").get_text())
	print(number)
	if number <= 0:
		game_over()
		
func game_over():
		get_tree().change_scene("res://Ui/Game OVer.tscn")
