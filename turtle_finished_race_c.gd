class_name TurtleFinishedRaceC extends Node


signal turtle_finished(turtle_name: String)
@export var animated_sprite: AnimatedSprite2D
@export var dust_particle: GPUParticles2D
@export var turtle_movement_c: TurtleMovementC


func _ready() -> void:
	turtle_movement_c.finished_race.connect(stop_turtle)


func stop_turtle(turtle_name: String)->void:
	print("Turtle: ", turtle_name, " finished!!!")
	animated_sprite.stop()
	dust_particle.emitting = false
	turtle_finished.emit(turtle_name)
