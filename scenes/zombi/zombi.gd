extends CharacterBody2D

@export var max_speed: float = 80
@export var max_health: int = 100
var current_health: int

var player: CharacterBody2D

func _ready():
	current_health = max_health
	player = get_tree().get_first_node_in_group("player") as Node2D
	update_health_bar()

func _process(delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = max_speed * direction
		move_and_slide()

func take_damage(amount: int):
	current_health = max(current_health - amount, 0)
	update_health_bar()
	if current_health <= 0:
		queue_free()  # враг умирает

func update_health_bar():
	var bar = $HealthBar as ProgressBar
	if bar:
		bar.value = current_health
