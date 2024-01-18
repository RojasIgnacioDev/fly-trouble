@tool
class_name SpriteShadow extends Node


@export var position_offset : Vector2
@export var scale_offset : float = 1.0
@export var sprite : Sprite2D


@onready var shadow_sprite : Sprite2D


func _ready():
	shadow_sprite = Sprite2D.new()
	shadow_sprite.texture = sprite.texture
	shadow_sprite.modulate = Color(0,0,0,1)
	shadow_sprite.z_index = -16
	shadow_sprite.name = "Shadow"
	add_child(shadow_sprite)


func _process(_delta):
	_shadowing()


func _shadowing():
	# position
	shadow_sprite.global_position.x = sprite.global_position.x + position_offset.x
	shadow_sprite.global_position.y = sprite.global_position.y + position_offset.y
	# rotation
	shadow_sprite.global_rotation = sprite.global_rotation
	# scale
	shadow_sprite.scale.x = sprite.scale.x * scale_offset
	shadow_sprite.scale.y = sprite.scale.y * scale_offset
