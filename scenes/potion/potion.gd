extends Area2D




@export var item: InventoryItem

@onready var sprite: Sprite2D = $Sprite2D

signal take_item(item)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if item:
		sprite.texture = item.texture
		sprite.scale = Vector2(1, 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	take_item.emit(item)
