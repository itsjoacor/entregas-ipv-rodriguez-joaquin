extends Camera2D

# Set your limits here
const LEFT_LIMIT := 0
const RIGHT_LIMIT := 2000

func _ready() -> void:
	top_level = true
	global_position.y = 100
	limit_left = LEFT_LIMIT
	limit_right = RIGHT_LIMIT
	# Activate the camera

func _process(delta: float) -> void:
	# Follow the parent in X, stay clamped between the limits
	global_position.x = clamp(get_parent().global_position.x, limit_left, limit_right)
