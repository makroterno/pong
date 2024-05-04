extends Area2D

var x_velocity = 300
var x_direction = 1
var y_velocity = 0
var y_direction = 1
@onready var player_1 = %Player1
@onready var player_2 = %Player2
@onready var scoreboard = %Scoreboard

var score_left = 0
var score_right = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += x_velocity * delta
	position.y += y_velocity * delta
	scoreboard.text = "Score: " + str(score_left) + "-" + str(score_right)

	

func _on_body_entered(body):
	print("body entered!!")
	print(body.name)
	if body.name == str("Player2"):
		x_velocity = - x_velocity
		if player_2.velocity.y != 0:
			y_velocity = player_2.velocity.y
	if body.name == "Player1":
		if player_1.velocity.y != 0:
			y_velocity = player_1.velocity.y
		x_velocity = - x_velocity


func _on_area_entered(area):
	print("area entered!!")
	print(area.name)
	if area.name == str("BottomWorldBoundary"):
		print("Bottom hit")
		y_velocity = -y_velocity
	if area.name == "UpWorldBoundary":
		print("Up hit")
		y_velocity = -y_velocity
		
	if area.name == str("LeftWorldBoundary"):
		print("Left hit")
		x_velocity = - x_velocity
		score_right += 1
	if area.name == "RightWorldBoundary":
		print("Right hit")
		score_left += 1
		x_velocity = - x_velocity
