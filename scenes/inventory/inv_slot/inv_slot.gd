extends Panel


@onready var backgroundTexture: Sprite2D = $background
@onready var itemTexture: Sprite2D = %itemIcon

func update(item: InventoryItem):
	if !item:
		#backgroundTexture.texture = item.texture
		itemTexture.visible = false
	else:
		itemTexture.visible = true
		itemTexture.texture = item.texture
		itemTexture.scale = Vector2(1,1)


func set_drag(drag: bool):
	itemTexture.is_drag = drag
	if !drag:
		cancel_drag()

func cancel_drag():
	itemTexture.position = Vector2(0,0)
