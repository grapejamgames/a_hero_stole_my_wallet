extends Control

@export var fade_time : float = 3
@export var wait_time : float = 5

func _on_texture_button_pressed() -> void:
	Music.play()
	$SplashScreen/CanvasModulate.color = Color(1.0, 1.0, 1.0, 0.0)
	$SplashScreen.visible = true
	var tween = get_tree().create_tween()
	tween.tween_property($SplashScreen/CanvasModulate, "color", Color(1.0, 1.0, 1.0, 1.0), fade_time)
	tween.tween_property($MainMenu, "visible", true, wait_time)


func _on_splash_screen_gui_input(event: InputEvent) -> void:
	if event:
		$MainMenu.visible = true
