class_name Turtle extends CharacterBody2D


@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var dust_particle: GPUParticles2D = $DustParticle


func _on_turtle_movement_c_finished_race(turtle_name: String) -> void:
	animated_sprite.stop()
	dust_particle.emitting = false
