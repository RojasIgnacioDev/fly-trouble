class_name Fly extends CharacterBody2D


signal meter_traveled(amount_meters : int)


@export var total_meters_traveled : int = 0


# used for measuring the distance traveled in meters
const METER_PER_PIXELS : int = 300
# movement speed 
const INITIAL_MOVEMENT_SPEED : float = 200
# in degress
const TURN_SPEED : float = 90


var initial_position : Vector2


func _ready():
	initial_position = self.global_position


func _process(delta):
	_monitor_travel_info()


func _physics_process(delta) -> void:
	_handle_turning(delta)
	_handle_movement()


func _handle_turning(dt : float) -> void:
	var turn_dir = Input.get_axis("turn_left", "turn_right")
	var rotation_force : float = deg_to_rad(TURN_SPEED) * turn_dir * dt
	var rotation_result : float = self.rotation + rotation_force
	
	if sin(rotation_result) < -0.35:
		self.global_rotation = rotation_result


func _handle_movement() -> void:
	self.velocity.x = cos(self.rotation) * INITIAL_MOVEMENT_SPEED
	self.velocity.y = sin(self.rotation) * INITIAL_MOVEMENT_SPEED
	move_and_slide()


# checks the distance traveled 
func _monitor_travel_info():
	var distance : float = initial_position.distance_to(self.global_position)
	var meters_traveled : int = distance / METER_PER_PIXELS
	
	if meters_traveled > total_meters_traveled:
		meter_traveled.emit(meters_traveled)
	
	total_meters_traveled = meters_traveled
	
