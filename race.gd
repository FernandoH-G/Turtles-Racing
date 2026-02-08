extends Control

signal declare_winner(winner_name: String)

func _ready() -> void:
	$Winner.hide()

func _on_turtle_v_1_finished_race(turtle_name: String) -> void:
	declare_winner.emit(turtle_name)


func _on_turtle_v_2_finished_race(turtle_name: String) -> void:
	declare_winner.emit(turtle_name)


func _on_declare_winner(winner_name: String) -> void:
	$Winner.visible = true
	$Label.text = "%s is the winner!" % winner_name
