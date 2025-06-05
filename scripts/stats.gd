extends Resource
class_name StatBlock

@export var max_health: int
var health: int

@export var speed: float
@export var damage: int
@export var armor: int

func _init():
	# При создании ресурса health = max_health, если max_health задан
	health = max_health if max_health != null else 0

func take_damage(amount: int) -> void:
	var final_damage = max(amount - armor, 0)
	health = max(health - final_damage, 0)

func is_dead() -> bool:
	return health <= 0
