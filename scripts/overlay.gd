extends CanvasLayer

@onready var score_label = $MarginContainer/ScoreLabel
@onready var header = $Dialog/Wrapper/Info/Header

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func update_score(score):
	score_label.text = "Score: %d" % score

func show_dialog(success, score, required):
	if success:
		header.text = "Level completed"
	else:
		header.text = "Level failed"
	$Dialog.show()

func hide_dialog():
	$Dialog.hide()
