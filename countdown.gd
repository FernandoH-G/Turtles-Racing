extends Control

var countdown_time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	countdown_time = 3
	$Label.text = str(countdown_time)
	$Timer.start()

func _on_timer_timeout() -> void:
	countdown_time -= 1
	$Label.text = str(countdown_time)
	if countdown_time == 0:
		$Timer.stop()
		get_tree().change_scene_to_file("res://scenes/race.tscn")
