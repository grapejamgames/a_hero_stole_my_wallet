extends Container

var node_ref : int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func swap_node(new_node : Node) -> void:
	var old_node : Node = $Polaroid
	if old_node:
		old_node.queue_free()

	add_child(new_node)
	new_node.name = "Polaroid"
	new_node.position = Vector2()
	new_node.rotation_degrees = 0
	new_node.show()