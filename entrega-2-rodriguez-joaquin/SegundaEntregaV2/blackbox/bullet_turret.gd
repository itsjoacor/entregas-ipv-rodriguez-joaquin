extends Area2D


var direction : Vector2 = Vector2.RIGHT
var speed : float = 300

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	

func _on_screen_exited() -> void:
	queue_free()
