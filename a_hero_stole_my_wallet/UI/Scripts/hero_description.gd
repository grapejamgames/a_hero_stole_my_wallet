extends Container
@export var hero_description: HeroDescription

@onready var texture_rect: TextureRect = $TextureRect
var statement : String

signal hide_grid
signal examine_polaroid(name: String, picture: Texture, statement: String)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print($Backend)
	#var heroes = $Backend.selected_heroes
	#print(heroes.selected_heroes)
	#print(heroes.size())
	texture_rect.texture = hero_description.headshot
	statement = "The villan wasn't wearing "


func _on_gui_input(event: InputEvent) -> void:
	#print("gui input event")
	if event is InputEventMouseButton:
		#print("input event mouse button")
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			print("A click happened!")
			examine_polaroid.emit(hero_description.name, hero_description.picture, statement)
			emit_signal("hide_grid")
