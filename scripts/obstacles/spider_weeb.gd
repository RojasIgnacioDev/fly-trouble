extends Node2D


const MIN_SIZE : float = 0.15
const MAX_SIZE : float = 0.35


@onready var collision : CollisionShape2D = $HurtBox/CollisionShape2D
@onready var sprite : Sprite2D = $Sprite


func _ready() -> void:
	# setting random rotation
	var random_rotation : float = randf_range(0, PI / 2)
	sprite.rotation = random_rotation
