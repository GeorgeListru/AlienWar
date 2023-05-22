extends Control

@onready var score_label = $ScoreLabel
@onready var lives_label = $LivesLabel


func set_score_label(new_score):
	score_label.text = "SCORE: " + str(new_score)

func set_lives_label(lives):
	lives_label.text = str(lives)
