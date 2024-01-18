class_name HurtArea extends Area2D


func _on_body_entered(body) -> void:
	if body is HitBox:
		body.on_hit();
