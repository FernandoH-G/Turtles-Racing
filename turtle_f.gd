class_name Turtle extends CharacterBody2D


@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var dust_particle: GPUParticles2D = $DustParticle
@export var turtle_movement_c: TurtleMovementC


func _ready() -> void:
	turtle_movement_c.finished_race.connect(finish_race)


func finish_race(turtle_name: String)->void:
	animated_sprite.stop()
	dust_particle.emitting = false
