extends CharacterBody2D

var speed = 500
var direccion = 0.0
var max_jumps = 3 
var remaining_jumps = max_jumps 
var gravity = 9  

func _process(delta):
	direccion = Input.get_axis("ui_left", "ui_right")
	velocity.x = direccion * speed
	

	if Input.is_action_just_pressed("ui_up") and remaining_jumps > 0:
		velocity.y = -250 
		remaining_jumps -= 1 
	velocity.y += gravity
	if is_on_floor():
		remaining_jumps = max_jumps
	move_and_slide()
