extends Control

var countdownTime

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	countdownTime = 3
	$Label.text = str(countdownTime)
	$Timer.start()

func _on_timer_timeout() -> void:
	countdownTime -= 1
	$Label.text = str(countdownTime)
	if countdownTime == 0:
		$Timer.stop()
		get_tree().change_scene_to_file("res://race.tscn")
