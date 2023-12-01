extends Node2D
var score = 0
var reqscore = 5
@onready var gos = $Overlay/Game_Over
@onready var finscore = $Overlay/Game_Over/Panel/Score
@onready var levelcomp = $Overlay/Game_Over/Panel/GameOver
@onready var reqscorenum = $Overlay/Game_Over/Panel/ReqScoreNum
@onready var nxtlvl = $Overlay/Game_Over/Panel/NextLevel
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_ball_hit():
	score += 1
	$Overlay.update_score(score)

func _on_ball_dead():
	finscore.text = str(score)
	reqscorenum.text = str(reqscore)
	if score >= reqscore:
		levelcomp.text = "Level Complete!"
		$Greatjob.play()
		nxtlvl.visible = true
	else:
		levelcomp.text = "Level Failed"
		$Gameover.play()
	gos.visible = true
