extends Node2D

signal item_taken(item: InventoryItem)
# signal item_picked_for_inventory(item: InventoryItem)  

@export var path_scene: String = "res://scenes/level1/level_1.tscn"
var current_level_instance: Node = null

func _ready():
	load_level(path_scene)

func load_level(scene_path: String):
	if current_level_instance:
		current_level_instance.queue_free()

	var scene_res = load(scene_path)
	if scene_res:
		current_level_instance = scene_res.instantiate()
		get_node("LevelRoot").add_child(current_level_instance)

		if current_level_instance.has_signal("item_taken"):
			current_level_instance.connect("item_taken", Callable(self, "_on_item_taken"))
	else:
		print("Не удалось загрузить уровень по пути: ", scene_path)

func _on_item_taken(item: InventoryItem) -> void:
	print("MainScene: предмет взят —", item.name)

	# Существующий сигнал (если нужен где-то еще)
	emit_signal("item_taken", item)

	# Новый сигнал для, например, inventory panel
	emit_signal("item_picked_for_inventory", item)

func _on_inventory_use_item(item: InventoryItem) -> void:
	print(item.name)
