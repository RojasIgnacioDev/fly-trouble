extends Sprite2D


var parent_offset : Vector2 = Vector2(-64, 64)


func _process(delta) -> void:
	_handle_parent_offset()


func _handle_parent_offset() -> void:
	var parent_position : Vector2 = owner.global_position
	self.global_position += parent_position - parent_position
