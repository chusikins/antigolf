extends Node2D
var score = 0
var reqscore = 2
@onready var gos = $Overlay/Game_Over
@onready var finscore = $Overlay/Game_Over/Panel/Score
@onready var levelcomp = $Overlay/Game_Over/Panel/GameOver
@onready var reqscorenum = $Overlay/Game_Over/Panel/ReqScoreNum

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_ball_hit():
	score += 1
	$Overlay.update_score(score)
	
func _on_hole_lvl_complete():
	print(gos)
	finscore.text = str(score)
	reqscorenum.text = str(reqscore)
	if score >= reqscore:
		levelcomp.text = "Level Complete!"
		$Greatjob.play()
	else:
		levelcomp.text = "Level Failed"
	gos.visible = true
