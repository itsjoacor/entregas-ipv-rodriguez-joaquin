extends Area2D

const SPEED: int = 300
var direction = Vector2.RIGHT

func _ready():
	body_entered.connect(_on_body_entered)
	area_entered.connect(_on_area_entered)

func _process(delta: float) -> void:
	position += direction * SPEED * delta

func _on_body_entered(body: Node):
	_handle_collision(body)

func _on_area_entered(area: Area2D):
	_handle_collision(area)

func _handle_collision(target: Node):
	
	if target.is_in_group("turrets"):
		target.queue_free()
		queue_free() 
	elif target.name == "TileMap": 
		queue_free()
