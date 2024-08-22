extends Node2D

@onready var grid_container: GridContainer = $CanvasLayer/GridContainer
@onready var button: Button = $CanvasLayer/GridContainer/Button


func _ready() -> void:
	button = button.duplicate()
	_clear_placeholder()
	
	var button_count = Global.levels_path.size()
	for i in button_count:
		var child: Button = button.duplicate() 
		child.text = str(i + 1)
		child.pressed.connect(_on_level_button.bind(i))
		grid_container.add_child(child)
		
	
func _clear_placeholder() -> void:
	var children = grid_container.get_children()
	for i in children:
		i.free()


func _on_level_button(level: int) -> void:
	Global.to_level.emit(level)
