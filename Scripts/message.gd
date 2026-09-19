extends Control

@onready var restart = $message/restart
@onready var label = $message

func _show(txt : String , time : float):
	label.text = txt
	label.visible_ratio = 0
	var tween = get_tree().create_tween()
	tween.tween_property(label,"visible_ratio",1,time)
	
	restart.wait_time = time*3
	restart.start()



func _on_restart_timeout() -> void:
	label.visible_ratio = 0
