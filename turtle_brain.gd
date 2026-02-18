class_name TurtleBrain extends CharacterBody2D


signal turtle_finished_race(turtle_name: String)
@export var turtle_name: String = "Turti"
@onready var turtle_movement_c: TurtleMovementC = $TurtleMovementC


func _ready() -> void:
	turtle_movement_c.stopped_moving.connect(finished_race)


func finished_race() -> void:
	print("Turtle: ", turtle_name, " finished!!!")
	$AnimatedSprite2D.stop()
	$DustParticle.emitting = false
	turtle_finished_race.emit(turtle_name)