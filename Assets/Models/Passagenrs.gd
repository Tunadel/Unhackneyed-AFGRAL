extends Label

var number

func _process(delta):
	number = int(.get_node("Number").get_text())
	if number <= 0:
		get_tree().change_scene("res://Ui/Game OVer.tscn")
		
