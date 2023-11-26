extends Control
const FILE_BEGIN = "res://level_"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	pass # Replace with function body.

func set_score(score):
	$Panel/Score.test = "Score : " + str(score) 


func _on_retry_pressed():
	var current_scene_file = get_tree().current_scene.scene_file_path
	print(current_scene_file)
#		var next_level_number = current_scene_file.to_int()+1
#		var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
#		get_tree().change_scene_to_file(next_level_path)
#		print(next_level_path)
	get_tree().change_scene_to_file(current_scene_file)


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_next_level_pressed():
	var current_scene_file = get_tree().current_scene.scene_file_path
	var next_level_number = current_scene_file.to_int()+1
	var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
	get_tree().change_scene_to_file(next_level_path)
