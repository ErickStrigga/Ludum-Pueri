extends Camera2D

func _ready():
	var tween = create_tween()
	tween.tween_property(self, "position:y", position.y + 250, 10).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
