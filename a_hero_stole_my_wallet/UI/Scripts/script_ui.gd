extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var polaroids = get_tree().get_nodes_in_group("filled_frames")
	for polaroid in polaroids:
		polaroid.frame_updated.connect(_on_frame_updated)
	$ExamineScreen.show_grid.connect(_on_show_grid)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hide_grid(polaroid : Node) -> void:
	get_tree().call_group("examine_container", "swap_node", polaroid)
	$ExamineScreen.show()


func _on_show_grid():
	pass



func _on_frame_updated(polaroid : Node) -> void:
	polaroid.hide_grid.connect(_on_hide_grid)
