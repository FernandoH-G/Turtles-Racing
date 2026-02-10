extends Control

signal declare_winner(winner_name: String)
var have_winner = false

func _ready() -> void:
	$WinnerParticles.hide()
	$VBoxContainer.hide()
	$VBoxContainer/ResetButton.hide()
	$VBoxContainer/ExitButton.hide()


func _on_turtle_v_1_finished_race(turtle_name: String) -> void:
	if have_winner == false:
		have_winner = true
		declare_winner.emit(turtle_name)


func _on_turtle_v_2_finished_race(turtle_name: String) -> void:
	if have_winner == false:
		have_winner = true
		declare_winner.emit(turtle_name)


func _on_declare_winner(winner_name: String) -> void:
	$WinnerParticles.show()
	$VBoxContainer.show()
	$VBoxContainer/ResetButton.show()
	$VBoxContainer/ExitButton.show()
	$WinnerLabel.text = "%s is the winner!" % winner_name


func _on_exit_button_pressed() -> void:
	print("pressed exit button")
	get_tree().quit()


func _on_reset_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/countdown.tscn")
