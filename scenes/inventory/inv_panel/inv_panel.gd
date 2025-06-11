extends Control


@onready var inventory: Inventory = preload("res://scenes/inventory/inventory_res.tres")
@onready var slots: Array  = $GridContainer.get_children()

var dragged_slot_index: int

signal use_item(item: InventoryItem)

const SLOT_ACTIONS = [
	"first_inventory_slot",
	"second_inventory_slot",
	"third_inventory_slot",
	"forth_inventory_slot"
]

func update():
	for i in range(min(inventory.items.size(), slots.size())):
		slots[i].update(inventory.items[i])

func _ready():
	dragged_slot_index = -1
	update()

func _update_item(index, newItem):
	inventory.items[index] = newItem
	slots[index].update(newItem)


func _is_drag() -> bool:
	return dragged_slot_index > -1
	
	
func _cancel_drag():
	slots[dragged_slot_index].set_drag(false)
	dragged_slot_index = -1


func _input(event):
	if !visible: return
	
	for i in SLOT_ACTIONS.size():
		if Input.is_action_just_pressed(SLOT_ACTIONS[i]):
			print(i)
			#print(inventory.items[i])
			if inventory.items[i] == null:
				break
			use_item.emit((inventory.items[i]))
	
	


func _on_main_scene_item_taken(item: InventoryItem) -> void:
	for i in range(inventory.items.size()):
		if !inventory.items[i]:
			_update_item(i, item)
			break
