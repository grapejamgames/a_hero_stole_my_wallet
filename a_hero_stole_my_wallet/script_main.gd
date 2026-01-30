extends Node

var selected_heroes : Array[Node] = $GameRound.selected_heroes
var not_guilty_heroes : Array[Node] = $GameRound.not_guilty_heroes
var guilty_hero : Array[Node] = $GameRound.guilty_hero

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	group_the_hero_nodes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func group_the_hero_nodes() -> void:
	var persist = true
	for hero in selected_heroes:
		hero.add_to_group("heroes", persist)
	for hero in selected_heroes:
		hero.add_to_group("unassigned_heroes", persist)
	for hero in not_guilty_heroes:
		hero.add_to_group("not_guilty", persist)