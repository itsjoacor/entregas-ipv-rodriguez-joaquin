extends Area2D

var direction: Vector2 = Vector2.RIGHT
var speed: float = 300

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _physics_process(delta):
	position += direction * speed * delta

func _on_screen_exited():
	queue_free()

func _on_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://GameOver/GameOver.tscn")
		queue_free()
