extends CanvasLayer

@onready var click: AudioStreamPlayer = $Click
@onready var credits: CanvasLayer = $Panel/Credits

func _ready() -> void:
	credits.hide()

func _on_play_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://scene_game.tscn")


func _on_credits_pressed() -> void:
	click.play()
	credits.show()


func _on_quit_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	SceneTree.quit


func _on_return_pressed() -> void:
	credits.hide()
