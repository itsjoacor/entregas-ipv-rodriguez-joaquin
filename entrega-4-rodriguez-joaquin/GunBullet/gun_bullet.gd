extends Area2D

const SPEED: int = 300
var direction = Vector2.RIGHT
var turrets_remaining = 0

func _ready():
	body_entered.connect(_on_body_entered)
	area_entered.connect(_on_area_entered)
	

	turrets_remaining = get_tree().get_nodes_in_group("turrets").size()
	print("Initial turrets: ", turrets_remaining)

func _process(delta: float) -> void:
	position += direction * SPEED * delta

func _on_body_entered(body: Node):
	_handle_collision(body)

func _on_area_entered(area: Area2D):
	_handle_collision(area)

func _handle_collision(target: Node):
	if target.is_in_group("turrets"):
		target.queue_free()
		turrets_remaining -= 1
		print("Turrets left: ", turrets_remaining)
		
		if turrets_remaining <= 0:
			end_game()
			
		queue_free()
	elif target.name == "TileMapLayer":
		queue_free()

func end_game():

	get_tree().change_scene_to_file("res://Menu/GameWon.tscn")
