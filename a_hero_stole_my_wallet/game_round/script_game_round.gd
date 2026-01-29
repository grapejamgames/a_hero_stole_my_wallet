extends Node


@export var _number_of_heroes : int

var heroes : Array[Node]
var attributes : Array[Node]
var rand_num := RandomNumberGenerator.new()
var guilty_hero : Node
var not_guilty_heroes : Array[Node]


func _init(number_of_heroes : int = 0) -> void:
	_number_of_heroes = number_of_heroes


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	heroes = get_tree().get_nodes_in_group("heroes")
	if heroes.is_empty():
		print("No heroes found")
		return

	get_tree().call_group("attributes", "validate")
	attributes = get_tree().get_nodes_in_group("attributes")
	if attributes.is_empty():
		print("No attributes found")
		return

	guilty_hero = choose_guilty_hero()
	guilty_hero.remove_from_group("not_guilty")
	guilty_hero.my_statement = guilty_hero.get_statement_about_me(false)

	not_guilty_heroes = get_tree().get_nodes_in_group("not_guilty")
	for hero in not_guilty_heroes:
		# Todo check for dupes
		hero.my_statement = guilty_hero.get_statement_about_me(true)
	
	console_output()


func choose_guilty_hero() -> Node:
	return get_random_hero()


func get_random_hero() -> Node:
	if heroes:
		var rand_int = rand_num.randi_range(0, heroes.size() - 1)
		return heroes[rand_int]
	return null

func console_output() -> void:
	print("The heroes are: ")
	for hero in heroes:
		print(hero.name, " : ", hero.get_description())
	
	print("The guilty hero is ", guilty_hero.name )		
	for hero in heroes:
		print(hero.name, " said ", hero.my_statement)
