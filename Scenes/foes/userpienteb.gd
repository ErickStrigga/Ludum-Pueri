extends CharacterBody2D

@onready var floor_detector = $RayCast2D
@onready var animation = $Sprite2D
@onready var wall_detector = $PARED
var direction = 1
var speed = 1200

func _ready() -> void:
	animation.play("default")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	velocity.x = speed * delta * direction
	

	if(!floor_detector.is_colliding() or wall_detector.is_colliding()):
		direction = -direction
		animation.flip_h = direction > 0
		floor_detector.position.x = 12  * direction
		wall_detector.target_position.x = 12 * direction
	
	move_and_slide()
