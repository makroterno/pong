extends Area2D

var x_direction_vector = -1
var velocity = 10
var y_direction_vector = 0       
@onready var ray_cast_right = $RayCast2D
@onready var ray_cast_left = $RayCast2D2
@onready var ray_cast_up = $RayCast2D3
@onready var ray_cast_down = $RayCast2D4

@onready var tilt_1 = %Tilt1
@onready var tilt_2 = %Tilt2

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Let's go!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#ray casting
	position.x += velocity * x_direction_vector
	position.y += velocity * y_direction_vector
	if ray_cast_right.is_colliding():
		print("collision right")
		x_direction_vector = -1
		if tilt_2.velocity.y != 0:
			y_direction_vector = tilt_2.velocity.y / 300
			
	if ray_cast_left.is_colliding():
		print("collision left")
		x_direction_vector = 1
		if tilt_1.velocity.y != 0:
			y_direction_vector = tilt_1.velocity.y / 300 # to scale
	if ray_cast_up.is_colliding():
		print("collision up")
		y_direction_vector = 1
	if ray_cast_down.is_colliding():
		print("collision down")
		y_direction_vector = -1

		
		
	
