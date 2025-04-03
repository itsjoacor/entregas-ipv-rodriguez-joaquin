extends CharacterBody2D

func _physics_process(_delta):
	var input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity = Vector2(input, 0) * 400
	move_and_slide()
