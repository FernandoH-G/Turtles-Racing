extends CharacterBody2D

var target = Vector2(1000,0)
@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	# userBoost will be enabled (and timed out if not reclicked) by the user to
	# give their turtle a little boost. Will be the min speed value.
	# var userBoost = randi_range(10, 20)

	var speed =  randi_range(0, 200)
	# print(speed)
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 10:
		move_and_slide()
		_animated_sprite.play("turtle-type2-moving")
	else:
		_animated_sprite.stop()
