extends RayCast

export var group = []
var i = 0
var event2 = true
var object
var a = 0
func _process(delta):
	if is_colliding():
		for i in group.size()-1:
			if get_collider().is_in_group(group[i]):
#				get_parent().get_node("Mouse Follow").event = false
				get_parent().get_parent().get_node("Control").event(i)
				play_event(i)
			enabler(false)
			var timer = Timer.new()
			timer.set_wait_time(3)
			timer.connect("timeout",self,"_on_timer_timeout") 
			add_child(timer) #to process
			timer.start() #to start
	
func play_event(event):
	event_enabler(true)
	get_parent().get_parent().get_node("Control").show()

func event_enabler(var boolean):
	get_tree().set_pause(boolean)

func enabler(var booleam):
	get_parent().get_node("colision_detection0").set_enabled(booleam) 
	get_parent().get_node("colision_detection1").set_enabled(booleam) 
	get_parent().get_node("colision_detection2").set_enabled(booleam) 
	get_parent().get_node("colision_detection3").set_enabled(booleam) 

func _on_timer_timeout():
	enabler(true)
#	get_parent().get_node("Mouse Follow").event = true
