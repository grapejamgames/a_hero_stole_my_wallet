extends Control

var name_text : String

signal show_grid
signal endgame(hero_name: String)


func _on_close_pressed() -> void:
	hide()
	emit_signal("show_grid")


func _on_accuse_pressed() -> void:
	endgame.emit(name_text)
