extends TileMap

@onready var waifu = $robowaifu


func _ready() -> void:
	waifu.play("default")
