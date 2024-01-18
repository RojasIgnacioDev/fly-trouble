extends Node2D


const MIN_SIZE : float = 0.15
const MAX_SIZE : float = 0.35


@onready var collision : CollisionShape2D = $CollisionShape2D
@onready var sprite : Sprite2D = $Sprite


func _ready() -> void:
	# setting random scale
	var initial_scale_value : float = randf_range(MIN_SIZE, MAX_SIZE)
	@warning_ignore("shadowed_variable_base_class")
	var initial_scale : Vector2 = Vector2(initial_scale_value, initial_scale_value)
	
	collision.scale = initial_scale
	sprite.scale = initial_scale
	
	# setting random rotation
	var random_rotation : float = randf_range(0, PI / 2)
	sprite.rotation = random_rotation
