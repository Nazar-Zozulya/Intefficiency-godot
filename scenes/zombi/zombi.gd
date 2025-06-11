extends CharacterBody2D

var max_speed = 80
var damage = 4

func _ready():
	current_health = max_health
	player = get_tree().get_first_node_in_group("player") as Node2D
	update_health_bar()

func _process(delta):
	var direction = get_direction_to_player()
	velocity = max_speed * direction
	move_and_slide()
	
		
			
func get_direction_to_player():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player != null:
		return (player.global_position - global_position).normalized()
	return Vector2(0,0)	 


func _player_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.take_damage(damage)
