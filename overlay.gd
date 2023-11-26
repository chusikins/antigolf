extends CanvasLayer

@onready var score_label = $MarginContainer/ScoreLabel
#@onready var header = $Dialog/Wrapper/Info/Header
#@onready var score = $Dialog/Wrapper/Info/Score
#@onready var required = $Dialog/Wrapper/Info/Required

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func update_score(score):
	score_label.text = "Score: %d" % score

#func show_dialog(success):
#	print("pee")
##	if success == 1:
##		header.text = "Level completed"
##	else:
##		header.text = "Level failed"
##	header.text = "Level completed"
##	print("pee")
##	score.text = "1"
##	required.text = "1"
#
#	$Dialog.visible
#
#func hide_dialog():
#	$Dialog.hide()
