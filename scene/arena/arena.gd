class_name Arena
extends Node2D

signal check_point_all_actived

var level
var check_point_count
var check_point_active_count

func _ready() -> void:
	_connect_check_point()


func _connect_check_point() -> void:
	await get_tree().create_timer(0).timeout
	var check_points = get_tree().get_nodes_in_group("check_point") as Array[CheckPoint]
	check_point_count = check_points.size()
	check_point_active_count = 0
	for point in check_points:
		if point is not CheckPoint:
			continue
		point.check_point_active_changed.connect(_on_check_point_active_changed)


func _on_check_point_active_changed(enable: bool) -> void:
	if enable:
		check_point_active_count += 1
	else:
		check_point_active_count -= 1
	
	if check_point_count == check_point_active_count:
		print("过关")
		check_point_all_actived.emit()
