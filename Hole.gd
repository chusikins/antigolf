extends CharacterBody2D


@export var acceleration:float
@export var start_speed:float
@export var ball: RigidBody2D

var speed = 0

func _ready():
	speed = start_speed

func _physics_process(delta):
	if ball && is_instance_valid(ball):
		speed += delta * acceleration
		var direction = position.direction_to(ball.position).normalized()
		velocity = direction * speed
	else:
		velocity = Vector2(0,0)
	move_and_slide()
