extends Node2D

const Bullet = preload("res://Gun/GunBullet/bullet.tscn")

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("shoot_from_gun"):
		var bullet_instance = Bullet.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = global_position
		bullet_instance.rotation = rotation
