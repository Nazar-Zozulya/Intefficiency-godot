extends Sprite2D


var is_drag: bool = false

func _process(delta):
	if is_drag:
		global_position = get_global_mouse_position()
