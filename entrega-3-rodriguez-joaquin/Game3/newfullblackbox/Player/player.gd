extends CharacterBody2D

var speed = 500
var direccion = 0.0



func _process(delta):
	direccion = Input.get_axis("ui_left", "ui_right")
	velocity.x = direccion * speed
	
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y -= 250
	velocity.y += 9
	move_and_slide()
