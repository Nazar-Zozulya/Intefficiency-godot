extends Control


@onready var inventory: Inventory = preload("res://scenes/inventory/inventory_res.tres")
@onready var slots: Array  = $GridContainer.get_children()


func update():
	for i in range(min(inventory.items.size(), slots.size())):
		slots[i].update(inventory.items[i])

func _ready():
	update()

func _update_item(index, newItem):
	inventory.items[index] = newItem
	slots[index].update(newItem)

func _on_area_2d_take_item(item: Variant) -> void:
	for i in range(inventory.items.size()):
		if !inventory.items[i]:
			_update_item(i, item)
			break
