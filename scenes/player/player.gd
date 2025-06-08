extends CharacterBody2D

@export var stats: StatBlock
var player_direction = false
var is_damaged = false
var is_hit_anim_playing = false

var dead_started = false


signal inventory_changed(inventory)

var inventory: Array = []


func _ready():
	stats.health = stats.max_health


func _process(delta):
	var direction = get_direction()
	update_animation(direction)
	update_velocity(direction)
	update_direction()

	# Проверка смерти и запуск анимации один раз
	if not dead_started and stats.health <= 0:
		dead_started = true
		die()

	$animations.flip_h = player_direction
	move_and_slide()
	$"../player_ui"/hpBar.text = str(stats.health)


func get_direction() -> Vector2:
	var movement_x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var movement_y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(movement_x, movement_y).normalized()


func update_animation(direction: Vector2) -> void:
	if is_hit_anim_playing or dead_started:
		return
	
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
	if dead_started:
		return 

	stats.take_damage(amount)
	is_damaged = true
	is_hit_anim_playing = true
	$animations.play("hit")

	async_func_reset_hit()


func async_func_reset_hit() -> void:
	await get_tree().create_timer(0.2).timeout
	is_hit_anim_playing = false
	is_damaged = false


func die() -> void:
	$animations.play("die")
	await $animations.animation_finished
	get_tree().reload_current_scene()
