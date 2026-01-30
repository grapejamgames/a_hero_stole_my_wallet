extends Container
@export var hero_description: HeroDescription

@onready var texture_rect: TextureRect = $TextureRect

var statement : String = "I don't know anything"
var hero : Node

signal hide_grid
signal examine_polaroid(name: String, picture: Texture, statement: String)
signal hero_assigned


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("/root/Main").game_ready.connect(_on_game_ready)


func _on_gui_input(event: InputEvent) -> void:
	#print("gui input event")
	if event is InputEventMouseButton:
		#print("input event mouse button")
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			#print("A click happened!")
			examine_polaroid.emit(hero_description.name, hero_description.picture, statement)
			emit_signal("hide_grid")


func assign_random_hero() -> void:
	hero = get_tree().get_nodes_in_group("unassigned_heroes").pick_random()
	if not hero:
		print(hero_description.name, " couldn't assign hero node")
	else:
		hero.remove_from_group("unassigned_heroes")
		update_frame(hero)
		hero_assigned.emit(hero.name)


func set_resource() -> void:
	if hero.get_resource():
		hero_description = hero.get_resource()
	else:
		print(hero.name, " is missing their resource file")


func _on_game_ready() -> void:
	assign_random_hero()


func _on_hero_assigned(assigned_name : String) -> void:
	# If hero is assigned twice, change this one.
	if hero.name == assigned_name:
		assign_random_hero()


func update_frame(assign_hero : Node) -> void:
	statement = hero.my_statement
	set_resource()
	hero_description.name = hero.name  # Use node name
	texture_rect.texture = hero_description.headshot