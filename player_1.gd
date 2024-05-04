extends CharacterBody2D


const SPEED = 750.0

# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("p1_up", "p1_down")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_collide(velocity * delta)
