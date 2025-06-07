extends Control

var player_ref = null

func _ready():
	player_ref = get_parent().get_parent()
	if player_ref:
		player_ref.connect("inventory_changed", Callable(self, "_on_inventory_changed"))
	else:
		print("player_ref не найден")

func _on_inventory_changed(inventory):
	var icons_container = $GridContainer  # если ты переименовал Panel в GridContainer, то так
	if icons_container == null:
		print("IconsContainer не найден")
		return

	for child in icons_container.get_children():
		child.queue_free()

	for item in inventory:
		var texture = load(item.icon)
		if texture:
			var icon = TextureRect.new()
			icon.texture = texture
			icon.custom_minimum_size = Vector2(64, 64)
			icon.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT
			icon.expand = true 
			icons_container.add_child(icon)
