extends Area2D

const BULLET = preload("res://GunBullet/GunBullet.tscn")

# Called every frame
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

	if Input.is_action_just_pressed("shoot"):
		var bullet_instance = BULLET.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = global_position 
		bullet_instance.rotation = rotation


		var direction = (get_global_mouse_position() - global_position).normalized()
		bullet_instance.set("direction", direction) 
func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))


func _on_screen_exited():
	queue_free()

func _on_body_entered(body):
	if body.name == "Turret":
		queue_free()
