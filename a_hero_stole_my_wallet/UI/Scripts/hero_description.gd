
extends Container
@export var hero_description: HeroDescription

@onready var texture_rect: TextureRect = $Control/PanelContainer/MarginContainer/VBoxContainer/headshot
@onready var label: Label = $Control/PanelContainer/MarginContainer/VBoxContainer/Label
@onready var panel_container: PanelContainer = $Control/PanelContainer

var statement : String = "I don't know anything"
var hero : Node

signal click
signal examine_polaroid(name_string: String, picture: Texture, statement: String)
signal hero_assigned


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("/root/Main").game_ready.connect(_on_game_ready)
	randomize()
	var random_tilt: float = randf_range(-2.5,2.5)
	panel_container.rotation_degrees = random_tilt
	label.text = hero_description.name


func _on_gui_input(event: InputEvent) -> void:
	#print("gui input event")
	if event is InputEventMouseButton:
		#print("input event mouse button")
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			#print("A click happened!")
			examine_polaroid.emit(hero_description.name, hero_description.picture, statement)
			emit_signal("click")


func assign_random_hero() -> void:
	hero = get_tree().get_nodes_in_group("unassigned_heroes").pick_random()
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
	assign_random_hero()


func update_frame(assigned_hero : Node) -> void:
	statement = assigned_hero.my_statement
	set_resource()
	hero_description.name = assigned_hero.name  # Use node name
	texture_rect.texture = hero_description.headshot
