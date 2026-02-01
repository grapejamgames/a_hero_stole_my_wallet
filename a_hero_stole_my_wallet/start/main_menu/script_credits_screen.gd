extends CenterContainer



func _on_credits_pressed() -> void:
	show()


func _on_back_pressed() -> void:
	hide()


func _on_rich_text_label_meta_clicked(meta: Variant) -> void:
	OS.shell_open(str(meta))
