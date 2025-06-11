extends Area2D




@export var item: InventoryItem

@onready var sprite: Sprite2D = $Sprite2D

signal take_item(item)


func _ready() -> void:
	if item:
		sprite.scale = Vector2(1, 1)


func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	take_item.emit(item)
