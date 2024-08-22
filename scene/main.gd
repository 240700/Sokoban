extends Node2D

@onready var victory_panel: Panel = $CanvasLayer/VictoryPanel
@onready var victory_panel_2: Panel = $CanvasLayer/VictoryPanel2
@onready var toolbar: HBoxContainer = $CanvasLayer/Toolbar

##持有当前景
@onready var scene_placeholder: Node:
	set(value):
		if is_instance_valid(scene_placeholder):
			scene_placeholder.queue_free()
		add_child(value)
		scene_placeholder = value

var current_level = 0

func _ready() -> void:
	child_entered_tree.connect(_hide_self_ui_all.unbind(1))
	
	Global.to_entry.connect(to_entry)
	Global.to_level.connect(to_level)
	Global.to_map.connect(to_map)
	
	Global.to_entry.emit()


##切换到入口界面
func to_entry() -> void:
	var entry = load("res://scene/entry/entry.tscn").instantiate()
	scene_placeholder = entry


##切换选关场景
func to_map() -> void:
	var map = load("res://scene/map/map.tscn").instantiate()
	scene_placeholder = map


##切换到关卡
func to_level(level: int) -> void:
	var level_node: Arena = load(Global.levels_path[level]).instantiate()
	level_node.check_point_all_actived.connect(victory)
	level_node.level = level

	scene_placeholder = level_node
	current_level = level
	toolbar.show()


func victory() -> void:
	scene_placeholder.set_deferred("process_mode", Node.PROCESS_MODE_DISABLED)
	if current_level + 1 == Global.levels_path.size():
		victory_panel_2.show()
	else:
		victory_panel.show()


func next() -> void:
	to_level(current_level + 1)


func refresh() -> void:
	to_level(current_level)


func _hide_self_ui_all() -> void:
	victory_panel.hide()
	victory_panel_2.hide()
	toolbar.hide()
