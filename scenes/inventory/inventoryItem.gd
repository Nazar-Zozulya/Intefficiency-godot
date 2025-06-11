extends Resource

class_name InventoryItem

@export var name: String = ""
@export var texture: Texture2D = null

@export var usable: bool = false
@export var equipable: bool = false
@export var weapon_scene: PackedScene = null
@export var animation_state: StringName = ""
@export var combine_with: Array[StringName] = []
@export var result_item: InventoryItem = null
