extends Node2D

@export var speed = 200

func _physics_process(delta):
	var velocity = Vector2.ZERO

	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1

	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * speed * delta
		position += velocity
