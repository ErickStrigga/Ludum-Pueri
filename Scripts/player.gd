extends CharacterBody2D

@onready var camera = $Camera2D
@onready var animation = $AnimatedSprite2D
@onready var invincibility_timer = $invincibility
@onready var flickering_timer = $flickering #para el efecto de parpadeo de la invencibilidad
@onready var healthbar = $CanvasLayer/Control/health
@onready var click_sound = $Click

var state = "stand"
const SPEED = 150
const JUMP_VELOCITY = -350.0
var health = 5:
	set(value):
		healthbar.value = value
		health = value


var invincible : bool = false


func _physics_process(delta: float) -> void:
	
	animation.play(state)
	
	
	# Add the gravity.
	if not is_on_floor():
		animation.play("jump")
		velocity += get_gravity() * delta

	if(state != "hit"):
		
		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			$Jump.play()


		#handle movement
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
			
			
			
			#animation and look direction
			state = "run"
			animation.flip_h = direction < 0
			
			
			
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			state = "stand"

	move_and_slide()

#jump back when damaged
func _jump_away():
	
	#jump parameters
	var xjump = 100
	var yjump = -100
	
	
	velocity.x = xjump * (1 - ( 2 * int(!animation.flip_h)))
	velocity.y = yjump



#attack area detected
func _on_damage_area_entered(area: Area2D) -> void:
	if invincible:
		return
	_jump_away()
	state = "hit"
	health -= 1
	invincible = true
	invincibility_timer.start()
	flickering_timer.start()



func _on_invincibility_timeout() -> void:
	invincible = false
	animation.visible = true
	flickering_timer.stop()


func _on_flickering_timeout() -> void:
	animation.visible = not animation.visible
	if state == "hit":
		state = "stand"


func _on_main_menu_pressed() -> void:
	click_sound.play()
	await  get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
