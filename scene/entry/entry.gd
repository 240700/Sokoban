extends Panel


func _on_start_pressed() -> void:
	Global.to_map.emit()


func _on_exit_pressed() -> void:
	get_tree().quit()
