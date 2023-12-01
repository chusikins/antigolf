extends CanvasLayer

@onready var score_label = $MarginContainer/ScoreLabel
@onready var gos = $Game_Over
@onready var finscore = $Game_Over/Panel/Score
@onready var levelcomp = $Game_Over/Panel/GameOver
@onready var reqscorenum = $Game_Over/Panel/ReqScoreNum
@onready var nxtlvl = $Game_Over/Panel/Buttons/NextLevel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func update_score(score):
	score_label.text = "Score: %d" % score

func show_dialog(score, reqscore):
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

func hide_dialog():
	$Dialog.hide()
