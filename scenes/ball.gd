extends Area2D

var x_velocity = 5
var x_direction = 1
var y_velocity = 0
var y_direction = 1
@onready var player_1 = %Player1
@onready var player_2 = %Player2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += x_velocity * x_direction
	position.y += y_velocity * y_direction



func _on_body_entered(body):
	print("body entered!!")
	print(body.name)
	if body.name == str("Player2"):
		print("player 2")
		x_direction = -1
		if player_2.velocity.y != 0:
			y_velocity = player_2.velocity.y / 50
	elif body.name == "Player1":
		print("player 1")
		if player_1.velocity.y != 0:
			y_velocity = player_1.velocity.y / 50
		x_direction = 1


func _on_area_entered(area):
	if area.name == str("BottomWorldBoundary"):
		print("Bottom hit")
		y_direction = -1
	elif area.name == "UpWorldBoundary":
		print("Up hit")
		y_direction = 1
		
	if area.name == str("LeftWorldBoundary"):
		print("Left hit")
		x_direction = 1
	elif area.name == "RightWorldBoundary":
		print("Right hit")
		x_direction = -1
