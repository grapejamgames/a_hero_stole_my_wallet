extends Button

func _on_pressed() -> void:
	var main = get_node_or_null("/root/Main")
	if main:
		text = "It's " + main.guilty_hero.name
