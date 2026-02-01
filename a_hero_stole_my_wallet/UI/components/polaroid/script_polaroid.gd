
extends Container
@export var hero_description: HeroDescription

@onready var texture_rect: TextureRect = $MarginContainer/VBoxContainer/HeroPhoto
@onready var bottom_label: Label = $MarginContainer/VBoxContainer/HeroStatement
@onready var top_label: Label = $MarginContainer/VBoxContainer/HeroName


var statement : String = "I don't know anything"
var hero : Node

signal polaroid_click
signal polaroid_mouse_down
signal frame_updated


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var main_scene = get_node_or_null("/root/Main")
	if main_scene: 
		main_scene.game_ready.connect(_on_game_ready)
	randomize_offsets()
	randomize_location()


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			#print("A click happened!", self)
			polaroid_click.emit(self.duplicate())
			polaroid_mouse_down.emit()


func assign_random_hero() -> void:
	var unassigned_heroes = get_tree().get_nodes_in_group("unassigned_heroes")
	if unassigned_heroes:
		hero = unassigned_heroes.pick_random()
		if not hero:
			print(hero_description.name, " couldn't assign hero node")
		else:
			hero.remove_from_group("unassigned_heroes")
			update_frame(hero)


func set_resource() -> void:
	if hero.get_resource():
		hero_description = hero.get_resource()
	else:
		print(hero.name, " is missing their resource file")


func _on_game_ready() -> void:
	hide()
	assign_random_hero()	


func update_frame(assigned_hero : Node) -> void:
	show()
	statement = assigned_hero.my_statement
	bottom_label.text = statement
	set_resource()
	hero_description.name = assigned_hero.name  # Use node name
	top_label.text = hero_description.name
	texture_rect.texture = hero_description.picture
	frame_updated.emit(self)


func randomize_offsets() -> void:
	var random_tilt : float = randf_range(-2.5,2.5)
	var random_placement : Vector2 = Vector2(randf_range(-100,100), randf_range(-100,100))
	rotation_degrees = random_tilt
	position += random_placement


func randomize_location() -> void:
	if get_parent() != get_node_or_null("/root"):
		var sibling = get_parent().get_children().pick_random()
		var sibling_position = sibling.position
		sibling.position = position
		position = sibling_position
