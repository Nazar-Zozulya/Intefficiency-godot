extends CharacterBody2D

@export var stats: StatBlock
var player_direction = false
var is_hurt = false

func _ready():
	if stats == null:
		stats = StatBlock.new()
		stats.max_health = 10
		stats.speed = 400
		stats.damage = 10
		stats.armor = 0

	stats.health = stats.max_health

	# Подключаем сигнал окончания анимации (Godot 4+ синтаксис)
	$animations.connect("animation_finished", Callable(self, "_on_animation_finished"))

func _process(delta):
	var direction = get_direction()

	# Если игрок не в состоянии удара — обновляем анимацию движения
	if not is_hurt:
		update_animation(direction)

	update_velocity(direction)
	update_direction()
	$animations.flip_h = player_direction
	move_and_slide()
	$player_ui/Label.text = str(stats.health)

func get_direction() -> Vector2:
	var movement_x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var movement_y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(movement_x, movement_y).normalized()

func update_animation(direction: Vector2) -> void:
	if direction != Vector2.ZERO:
		$animations.play("run")
	else:
		$animations.play("idle")

func update_velocity(direction: Vector2) -> void:
	velocity = direction * stats.speed

func update_direction() -> void:
	if velocity.x < 0:
		player_direction = true
	elif velocity.x > 0:
		player_direction = false

func take_damage(amount: int) -> void:
	stats.take_damage(amount)
	$animations.play("hit")
	is_hurt = true
	print("Игрок получил урон, здоровье:", stats.health)

func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "hit":
		is_hurt = false
		# После удара обновляем анимацию по текущему направлению
		var direction = get_direction()
		update_animation(direction)
