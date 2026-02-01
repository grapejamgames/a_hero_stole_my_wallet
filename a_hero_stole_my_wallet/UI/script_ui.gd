extends Control

@onready var main = get_node_or_null("/root/Main")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var polaroids = get_tree().get_nodes_in_group("filled_frames")
	for polaroid in polaroids:
		polaroid.frame_updated.connect(_on_frame_updated)
	$Endgame.hero_chosen.connect(_on_hero_chosen)
	$ExamineScreen.endgame_check.connect(_on_endgame_check)
	setup_sounds()


# Show the examine screen
func _on_polaroid_click(polaroid : Node) -> void:
	if main:
		main.chosen_hero = polaroid.hero_description.name
	get_tree().call_group("examine_container", "swap_node", polaroid)
	$ExamineScreen.show()


func _on_frame_updated(polaroid : Node) -> void:
	polaroid.polaroid_click.connect(_on_polaroid_click)


func _on_hero_chosen() -> void:
	if main:
		var guilty_hero = main.guilty_hero.name
		var chosen_hero = main.chosen_hero

		print(guilty_hero, ", ", chosen_hero)
		$Endgame.correct_answer = guilty_hero == chosen_hero


func _on_endgame_check() -> void:
	$Endgame.show()


func setup_sounds() -> void:
	var click : AudioStreamPlayer = $Sounds/Click
	var page_flip : AudioStreamPlayer = $Sounds/PageFlip

	if click:
		var buttons = get_tree().get_nodes_in_group("buttons")
		for button in buttons:
			button.button_down.connect(click.play)

	if page_flip:
		var polaroids = get_tree().get_nodes_in_group("filled_frames")
		for polaroid in polaroids:
			polaroid.polaroid_mouse_down.connect(page_flip.play)
