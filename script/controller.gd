class_name Controller
extends Node


@export var player: Player


func _unhandled_key_input(_event: InputEvent) -> void:
	var direction = Vector2.ZERO
	var vector_h = Vector2(Input.get_axis("left", "right"), 0)
	var vector_v = Vector2(0, Input.get_axis("up", "down"))
	

	if not vector_h.is_equal_approx(Vector2.ZERO):
		direction = vector_h
	elif not vector_v.is_equal_approx(Vector2.ZERO):
		direction = vector_v
	
	player.move(direction)
