class_name CheckPoint
extends Node2D

signal check_point_active_changed(enable: bool)


var check_point_active = false:
	set(value):
		check_point_active = value
		check_point_active_changed.emit(value)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Crate:
		check_point_active = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Crate:
		check_point_active = false
