extends Panel


@onready var backgroundTexture: Sprite2D = $background
@onready var itemTexture: Sprite2D = $background/CenterContainer/Panel/itemIcon

func update(item: InventoryItem):
	if !item:
		#backgroundTexture.texture = item.texture
		itemTexture.visible = false
	else:
		itemTexture.visible = true
		itemTexture.texture = item.texture
		itemTexture.scale = Vector2(1,1)
