extends Node

var score = 0

@onready var score_label = $ScoreLabel

func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " coins."

func become_host():
	print("become host pressed")
	
func join_as_player_2():
	print("join as player 2")
