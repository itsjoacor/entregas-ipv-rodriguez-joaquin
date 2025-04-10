extends CharacterBody2D

var speed := 120
var direccion := 0.0
var jump := 250
const gravity := 9
var jump_times := 0

func _physics_process(delta):
	direccion = Input.get_axis("ui_left", "ui_right")
	velocity.x = direccion * speed

	if (jump_times < 2) and Input.is_action_just_pressed("jump"):
		velocity.y -= jump
		jump_times += 1
	if is_on_floor():
		jump_times = 0
	velocity.y += gravity
	move_and_slide()
