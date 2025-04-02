extends CharacterBody2D
var bullet_path=preload("res://bullets.tscn")

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1 
	else:
		scale.y = 1 
		
	if Input.is_action_just_pressed("fire"):
		var bullet = bullet_path.instantiate()
	
		bullet.global_position = global_position

		bullet.direction = (get_global_mouse_position() - global_position).normalized()
		bullet.rotation = bullet.direction.angle()
		get_tree().current_scene.add_child(bullet)
		
		
	
