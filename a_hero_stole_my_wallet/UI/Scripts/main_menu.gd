extends CanvasLayer

@onready var click: AudioStreamPlayer = $Click

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://main.tscn")


func _on_settings_pressed() -> void:
	click.play()


func _on_credits_pressed() -> void:
	click.play()


func _on_quit_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	SceneTree.quit
