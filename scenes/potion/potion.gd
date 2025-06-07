extends Area2D


var potion = {
	'id': 'potion_1',
	"name": "Зелье здоровья",
	"type": "potion",
	"description": "Восстанавливает 50 здоровья",
	"icon": "res://scenes/potion/potion.png",
	"scene_path": "res://scenes/potion/potion.tscn",
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('player'):
		body.add_to_inventory(potion)
