extends Control

signal declare_winner(winner_name: String)
var have_winner = false
@onready var turtle_f: TurtleBrain = $TurtleF
@onready var turtle_w: TurtleBrain = $TurtleW

func _ready() -> void:
	$WinnerParticles.hide()
	$VBoxContainer.hide()
	# Do these need @onready because they're signals?
	turtle_f.turtle_finished_race.connect(turtle_f_finished)
	turtle_w.turtle_finished_race.connect(turtle_w_finished)


func turtle_f_finished(turtle_name: String) -> void:
	if have_winner == false:
		have_winner = true
		declare_winner.emit(turtle_name)


func turtle_w_finished(turtle_name: String) -> void:
	if have_winner == false:
		have_winner = true
		declare_winner.emit(turtle_name)


func _on_declare_winner(winner_name: String) -> void:
	$WinnerParticles.show()
	$VBoxContainer.show()
	$WinnerLabel.text = "%s is the winner!" % winner_name


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_reset_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/countdown.tscn")
