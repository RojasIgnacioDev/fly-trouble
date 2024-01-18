class_name HitBox extends Area2D


signal dead


var is_alive = true


func on_hit() -> void:
	is_alive = false
	dead.emit()
