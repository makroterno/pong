extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction = 1
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var tilt_1 = %Tilt1
@onready var tilt_2 = %Tilt2



func _physics_process(delta):
	
	velocity.x = SPEED * direction
	velocity.y = 0
		
	move_and_slide()
	"""
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()"""
