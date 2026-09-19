extends Control

@onready var click_sound = $Click
@onready var bg_sound = $Bg_sound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await  get_tree().create_timer(0.3).timeout
	bg_sound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_main_menu_pressed() -> void:
	click_sound.play()
	await  get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_bg_sound_finished() -> void:
	bg_sound.play()
