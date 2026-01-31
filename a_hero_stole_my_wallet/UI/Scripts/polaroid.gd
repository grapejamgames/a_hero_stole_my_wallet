extends VBoxContainer
@onready var hero_name: Label = $PanelContainer/MarginContainer/VBoxContainer/HeroName
@onready var texture_rect: TextureRect = $PanelContainer/MarginContainer/VBoxContainer/TextureRect
@onready var hero_statement: Label = $PanelContainer/MarginContainer/VBoxContainer/HeroStatement

var name_text : String

signal show_grid
signal endgame(hero_name: String)



func _on_hero_headshot_examine_polaroid(name_string: String, picture: Texture, statement: String) -> void:
	#print("updating polaroid")
	hero_name.text = name_string
	name_text = name_string
	texture_rect.texture = picture
	hero_statement.text = statement
	queue_redraw()

func _on_close_pressed() -> void:
	emit_signal("show_grid")


func _on_accuse_pressed() -> void:
	endgame.emit(name_text)
