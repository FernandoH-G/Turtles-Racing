extends Control

signal declare_winner(winner_name: String)
var have_winner = false

func _ready() -> void:
	$WinnerParticles.hide()


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
	$Label.text = "%s is the winner!" % winner_name
