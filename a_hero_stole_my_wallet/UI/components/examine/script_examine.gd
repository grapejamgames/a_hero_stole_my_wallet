extends Control

signal endgame_check


func _on_close_pressed() -> void:
	hide()


func _on_accuse_pressed() -> void:
	endgame_check.emit()
