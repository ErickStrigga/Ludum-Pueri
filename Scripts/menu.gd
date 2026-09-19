extends Control

@onready var click_sound = $"Click sound"
@onready var bg_sound = $"BgSound"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await  get_tree().create_timer(0.5).timeout
	bg_sound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	click_sound.play()
	await  get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://Scenes/home.tscn")



func _on_credits_pressed() -> void:
	click_sound.play()
	await  get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")


func _on_exit_pressed() -> void:
	click_sound.play()
	await  get_tree().create_timer(0.3).timeout
	get_tree().quit()

func _on_bg_sound_finished() -> void:
	bg_sound.play()
