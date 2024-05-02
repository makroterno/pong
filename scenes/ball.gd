extends Area2D

var velocity = 5
var direction = 1
@onready var player_1 = %Player1
@onready var player_2 = %Player2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += velocity * direction
	print(position.x)


func _on_body_entered(body):
	print("body entered!!")
	print(body.name)
	if body.name == str("Player2"):
		print("player 2")
		direction = -1
	elif body.name == "Player1":
		print("player 1")
		direction = 1
