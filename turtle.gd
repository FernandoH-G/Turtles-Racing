extends CharacterBody2D

var target = Vector2(1000,0)

func _physics_process(_delta: float) -> void:
	# userBoost will be enabled (and timed out if not reclicked) by the user to
	# give their turtle a little boost. Will be the min speed value.
	# var userBoost = randi_range(10, 20)

	var speed =  randi_range(0, 200)
	# print(speed)
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 10:
		move_and_slide()

	# # Add the gravity.
	# if not is_on_floor():
	# 	velocity += get_gravity() * delta

	# # Handle jump.
	# if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	# 	velocity.y = JUMP_VELOCITY

	# # Get the input direction and handle the movement/deceleration.
	# # As good practice, you should replace UI actions with custom gameplay actions.
	# var direction := Input.get_axis("ui_left", "ui_right")
	# if direction:
	# 	velocity.x = direction * SPEED
	# else:
	# 	velocity.x = move_toward(velocity.x, 0, SPEED)

	# move_and_slide()
