class_name Crate
extends CharacterBody2D

var _tween: Tween

var _is_moving = false

var destination: Vector2


func move(direction: Vector2) -> void:
	if not _can_move(direction):
		return
	
	_is_moving = true
	collision_layer = Global.COLLISION_LAYER_GHOST
	
	_tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	_tween.tween_property(self, "position", destination, 0.2)\
		.set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	_tween.tween_callback(func(): 
		_is_moving = false
		collision_layer = Global.COLLISION_LAYER_CRATE
	)



func _can_move(direction: Vector2) -> bool:
	if (_is_moving):
		return false
	
	destination = position + Global.TILE_SIZE * direction
	var query = PhysicsRayQueryParameters2D.create(position, destination, Global.COLLISION_MASK_CRATE, [self.get_rid()])
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(query)
	
	return result.is_empty()
