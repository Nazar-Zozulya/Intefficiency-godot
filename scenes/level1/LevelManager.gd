extends Node2D

signal item_taken(item: InventoryItem)

func _ready():
	for item in get_tree().get_nodes_in_group("item"):
		item.connect("take_item", Callable(self, "_on_item_taken"))

func _on_item_taken(item: InventoryItem):
	print("Level1: взят предмет:", item.name)
	emit_signal("item_taken", item)
