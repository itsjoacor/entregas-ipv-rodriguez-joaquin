extends Camera2D


func _ready() -> void:
	top_level = true 
	global_position.y = 100
	
func _process(delta):
	global_position.x = get_parent().global_position.x
