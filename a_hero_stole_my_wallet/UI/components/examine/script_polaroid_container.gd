extends Container

func swap_node(new_node : Node) -> void:
	for old_node in get_children():
		old_node.queue_free()

	add_child(new_node)
	new_node.name = "Polaroid"
	new_node.position = Vector2()
	new_node.rotation_degrees = 0
	new_node.show()