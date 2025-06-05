extends CharacterBody2D

var max_speed = 200
var player_direction = false

func _ready():
	pass


func _process(delta):
	var movement = movement_vector()
	var direction = movement.normalized()
	if direction != Vector2.ZERO:
		$animations.play("run")
	else:
		$animations.play("idle")
		
		
	velocity = max_speed * direction
	
	if velocity.x < 0:
		player_direction = true
	elif velocity.x > 0:
		player_direction = false
	
	
	$animations.flip_h = player_direction
	
	move_and_slide()

func movement_vector():
	var movement_x = Input.get_action_strength('move_right') - Input.get_action_strength('move_left')
	var movement_y = Input.get_action_strength('move_down') - Input.get_action_strength('move_up')
	return Vector2(movement_x, movement_y)
