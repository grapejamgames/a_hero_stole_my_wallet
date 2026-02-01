extends CanvasLayer

@onready var click: AudioStreamPlayer = $Click


func _on_play_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://scene_game.tscn")


func _on_credits_pressed() -> void:
	click.play()


func _on_quit_pressed() -> void:
	click.play()
	Music.stop()
	get_tree().reload_current_scene()

func _on_back_pressed() -> void:
	click.play()


func _on_instructions_pressed() -> void:
	click.play()
