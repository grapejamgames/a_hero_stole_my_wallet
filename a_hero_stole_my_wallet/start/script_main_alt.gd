extends Node

@onready var selected_heroes : Array[Node] = $GameRound.selected_heroes
@onready var not_guilty_heroes : Array[Node] = $GameRound.not_guilty_heroes
@onready var guilty_hero : Node = $GameRound.guilty_hero
var chosen_hero : String

signal game_ready


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	group_the_hero_nodes()
	game_ready.emit()
	print(guilty_hero.name)


func group_the_hero_nodes() -> void:
	var persist = true
	for hero in selected_heroes:
		hero.add_to_group("heroes", persist)
	for hero in selected_heroes:
		hero.add_to_group("unassigned_heroes", persist)
	for hero in not_guilty_heroes:
		hero.add_to_group("not_guilty", persist)
