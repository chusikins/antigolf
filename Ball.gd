extends RigidBody2D

@export var movement_threshold:float = 10
@export var min_vector:float = 100
@export var max_vector:float = 200
@export var min_force:float = 1000
@export var max_force:float = 2000

var _mouse_position = null
var _is_mouse_down := false
var _is_dead := false

func can_move():
	var is_stationary = get_linear_velocity().length() < movement_threshold
	return is_stationary and !_is_dead
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_pressed():
				_is_mouse_down = true
			else:
				_is_mouse_down = false
				_mouse_released()
	elif event is InputEventScreenTouch:
		if event.is_pressed():
			_is_mouse_down = true
		else:
			_is_mouse_down = false
			_mouse_released()

	if (event is InputEventMouseMotion or event is InputEventScreenDrag) and _is_mouse_down:
		_mouse_position = get_local_mouse_position()
	else:
		_mouse_position = null

	queue_redraw()


func _draw():
	if _mouse_position != null and can_move():
		var end_point = _mouse_position
		var distance = end_point.length()

		var direction = end_point.normalized()
		var vectorLength = max(distance, min_vector)
		vectorLength = min(vectorLength, max_vector)
		var to = direction * vectorLength

#		print_debug(position, to)
		draw_line(Vector2(0, 0), to, Color.WHITE, 4)

func _play_hit_sfx():
	$hitSFX.play()
	
func _mouse_released():
	if _mouse_position != null and can_move():
		var end_point = position + _mouse_position
		var distance = position.distance_to(end_point)
		var direction = (end_point - position).normalized()
		var vectorLength = max(distance, min_vector)
		vectorLength = min(vectorLength, max_vector)
		var force = min_force + (
			(vectorLength - min_vector) * (max_force - min_force)
		) / (max_vector - min_vector)
		
#		print_debug(position, end_point, direction, force)
		
		apply_force(direction * force)
		_play_hit_sfx()




func _on_area_2d_area_entered(area):
	# print(area.name, " entered ball")
	# change scenes
	#if area.name == "hole_area":
		#print("area check")
	if area.name == "SandArea":
		print("Ball in sand!")
		print("x = ", linear_velocity.length())
		linear_velocity = linear_velocity * (0.5)
		print("x = ", linear_velocity.length())
	


func _on_area_2d_area_exited(area):
	print(area.name, " exited ball")
	

func _on_body_entered(body):
	$collisionSFX.play()
