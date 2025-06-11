extends Area2D
var zombi_scene = "res://scenes/zombi/zombi.tscn"

func _ready():
	print (zombi_scene)


func _on_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):

		spawn_scene()
		
func spawn_scene():
	
	var scene = load(zombi_scene) as PackedScene
	if scene:
		var instance = scene.instantiate()
		add_child(instance)
		instance.position = Vector2(400, 300)  # установить позицию при появлении
