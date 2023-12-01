extends Node2D
var score = 0
var reqscore = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_ball_hit():
	score += 1
	$Overlay.update_score(score)


func _on_ball_dead():
	$Overlay.show_dialog(score, reqscore)
