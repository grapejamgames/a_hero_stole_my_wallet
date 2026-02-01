extends ColorRect

func _on_option_button_item_selected(index: int) -> void:
	if index == 0:
		Music.volume_db = 0
	if index == 1:
		Music.volume_db = -10.0
	if index == 2:
		Music.volume_db = -80.0
