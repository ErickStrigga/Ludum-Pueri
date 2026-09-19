extends AnimatedSprite2D

@onready var text = $message

func _interact():
	text._show("Shut up, I couldn't buy my outliner",1.5)
