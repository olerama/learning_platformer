extends Actor

export var stomp_impulse := 1000

func _on_Area2D_area_entered(area: Area2D):
	if(global_position.y < area.global_position.y):
		_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)

func _on_Area2D_body_entered(body: PhysicsBody2D):
	PlayerData.deaths += 1
	queue_free()
	
func _physics_process(delta):
	var is_jump_interrupted := Input.is_action_just_released("jump") && _velocity.y < 0
	var direction := get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
func get_direction() -> Vector2: 
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") && is_on_floor() else 0.0
	)
	
func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
	var out := linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	out.y = speed.y if out.y > speed.y else out.y
	if(direction.y < 0):
		out.y = speed.y * direction.y
	if(is_jump_interrupted):
		out.y = 0.0
	return out

func calculate_stomp_velocity(
		linear_velocity: Vector2,
		stomp_impulse: float
	):
	var out := linear_velocity
	out.y = -stomp_impulse
	return out
