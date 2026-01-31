extends Node


@export var _number_of_heroes : int

var selected_heroes : Array[Node]
var attributes : Array[Node]
var rand_num := RandomNumberGenerator.new()
var guilty_hero : Node
var not_guilty_heroes : Array[Node]


func _init(number_of_heroes : int = 0) -> void:
	_number_of_heroes = number_of_heroes


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	selected_heroes = get_random_heroes(_number_of_heroes)
	if selected_heroes.is_empty():
		print("No heroes selected")
		return

	get_tree().call_group("attributes", "validate")
	attributes = get_tree().get_nodes_in_group("attributes")
	if attributes.is_empty():
		print("No attributes found")
		return

	not_guilty_heroes = selected_heroes.duplicate(true)
	guilty_hero = $Heroes/Phillip #choose_guilty_hero(not_guilty_heroes)
	guilty_hero.remove_from_group("not_guilty")
	guilty_hero.my_statement = guilty_hero.get_statement_about_me(false)

	for hero in not_guilty_heroes:
		# Todo check for dupes
		hero.my_statement = guilty_hero.get_statement_about_me(true)
	
	#console_output()


func choose_guilty_hero(heroes : Array[Node]) -> Node:
	return pop_random_hero(heroes)

# pick a random value from the array but then remove it from the array
# so that subsequent selections don't repeat
func pop_random_hero(hero_list : Array[Node]) -> Node:
	if hero_list:
		var selected = hero_list.pick_random()
		hero_list.erase(selected)
		return selected
	return null


func console_output() -> void:
	print("The selected heroes are: ")
	for hero in selected_heroes:
		print(hero.name, " : ", hero.get_description())
	
	print("The guilty hero is ", guilty_hero.name )		
	for hero in selected_heroes:
		print(hero.name, " said ", hero.my_statement)

func get_random_heroes(number_of_heroes : int) -> Array[Node]:
	var unselected_heroes : Array[Node] = $Heroes.get_children()
	for i in range(number_of_heroes):
		selected_heroes.push_back(pop_random_hero(unselected_heroes))
	return selected_heroes
