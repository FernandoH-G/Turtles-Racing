class_name TurtleFinishedRaceC extends Node


@export var animated_sprite: AnimatedSprite2D
@export var dust_particle: GPUParticles2D
@export var turtle_movement_c: TurtleMovementC


func _ready() -> void:
	turtle_movement_c.finished_race.connect(finish_race)


func finish_race(turtle_name: String)->void:
	print("Turtle: ", turtle_name, " finished!!!")
	animated_sprite.stop()
	dust_particle.emitting = false
