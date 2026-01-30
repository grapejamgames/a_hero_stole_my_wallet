extends Container
@export var hero_description: HeroDescription

@onready var texture_rect: TextureRect = $TextureRect
var costume_color : String
var statement : String

var costume_color_names :={
	HeroDescription.costume_colors.blue: "blue",
	HeroDescription.costume_colors.green: "green",
	HeroDescription.costume_colors.red: "red"
}

signal hide_grid
signal examine_polaroid(name: String, picture: Texture, statement: String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_rect.texture = hero_description.headshot
	get_costume_color()
	statement = "The villan wasn't wearing " + costume_color + "."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_gui_input(event: InputEvent) -> void:
	#print("gui input event")
	if event is InputEventMouseButton:
		#print("input event mouse button")
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			print("A click happened!")
			examine_polaroid.emit(hero_description.name, hero_description.picture, statement)
			emit_signal("hide_grid")

func get_costume_color():
	if hero_description.costume_color == hero_description.costume_colors.red:
		costume_color = "red"
	elif hero_description.costume_color == hero_description.costume_colors.blue:
		costume_color = "blue" 
	else: 
		costume_color = "green"
