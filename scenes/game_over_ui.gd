extends Control

@onready var final_score_label = $FinalScoreLabel

func set_final_score_label(score):
	final_score_label.text = "SCORE: " + str(score)


func _on_reset_button_pressed():
	get_tree().reload_current_scene()
