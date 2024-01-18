class_name Fly extends CharacterBody2D


const INITIAL_MOVEMENT_SPEED : float = 200
# in degress
const TURN_SPEED : float = 80


func _physics_process(delta) -> void:
	_handle_turning(delta)
	_handle_movement()


func _handle_turning(dt : float) -> void:
	var turn_dir = Input.get_axis("turn_left", "turn_right")
	var rotation_force : float = deg_to_rad(TURN_SPEED) * turn_dir * dt
	var rotation_result : float = self.rotation + rotation_force
	
	if sin(rotation_result) < -0.35:
		self.global_rotation = rotation_result

func _handle_movement():
	self.velocity.x = cos(self.rotation) * INITIAL_MOVEMENT_SPEED
	self.velocity.y = sin(self.rotation) * INITIAL_MOVEMENT_SPEED
	move_and_slide()



