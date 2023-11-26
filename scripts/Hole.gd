extends CharacterBody2D


@export var acceleration:float = 100
@export var ball: RigidBody2D

var speed = 50

func _physics_process(delta):
	speed += delta * acceleration
	var direction = position.direction_to(ball.position).normalized()
	velocity = direction * speed
	move_and_slide()
	


func _on_area_2d_area_entered(area):
	# print(area.name, " entered hole")
	pass


func _on_area_2d_area_exited(area):
	# print(area.name, " exited hole")
	pass
