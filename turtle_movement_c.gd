class_name TurtleMovementC extends Node


signal finished_race(turtle_name: String)
@export var min_speed: int = 0
@export var max_speed: int = 200
@export var turtle_name: String = "Fern"
@onready var parent: CharacterBody2D = get_parent()
var end_point: Marker2D = null
var end_position: Vector2


func _ready() -> void:
	end_point = parent.get_node_or_null("Marker2D")
	var start_position: Vector2
	start_position = parent.position
	if end_point == null:
		end_position = start_position + Vector2(200, 0)
		return
	end_position = end_point.global_position 


func move_forward() -> void:
	var speed = randi_range(min_speed, max_speed)
	parent.velocity = parent.position.direction_to(end_position) * speed
	parent.move_and_slide()
	
	
func stop_moving() -> void:
	finished_race.emit(turtle_name)
	process_mode = Node.PROCESS_MODE_DISABLED
	
	
func _physics_process(_delta: float) -> void:
	# userBoost will be enabled (and timed out if not reclicked) by the user to
	# give their turtle a little boost. Will be the min speed value.
	# var userBoost = randi_range(10, 20)
	if parent.position.distance_to(end_position) > 10:
		move_forward()
	else:
		stop_moving()
