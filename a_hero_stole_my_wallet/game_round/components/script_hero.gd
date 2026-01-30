## The character without a graphic. Description is a key/value for noun/verbs
class_name Hero

extends Node

@export var _description : Dictionary[String, Array]
@export var _resource : HeroDescription

var my_statement : String
var all_attributes : Dictionary[String, Node]  # All attributes
var rand_num = RandomNumberGenerator.new()


func _init(description = null) -> void:
	match typeof(description):
		TYPE_DICTIONARY:
			add_description(description)


func _ready() -> void:
	if not _resource:
		set_resource()

	get_all_attributes()
	if all_attributes.is_empty():
		print(name, " couldn't find any attributes")
		return

	description_to_lowercase()
	populate_my_nouns()
	remove_extra_attributes()
	populate_adjectives()

	if _description.is_empty():
		print(name, " has no description")
		for group in get_groups():
			remove_from_group(group)
		return


func populate_adjectives() -> void:
	# Add these adjectives to the attributes
	for noun in _description.keys():
		var adjectives = _description[noun]
		var existing_adjectives = all_attributes[noun].get_adjectives()
		for adjective in adjectives:
			if not existing_adjectives.has(adjective):
				existing_adjectives.push_back(adjective)


# Ensure keys and values are lowercase to avoid errors.
func description_to_lowercase() -> void:
	var lower_description : Dictionary[String, Array]
	for key in _description.keys():
		# lowercase the values
		for i in range(_description[key].size()):
			_description[key][i] = _description[key][i].to_lower()
		# lowercase the key
		lower_description[key.to_lower()] = _description[key]	
	_description = lower_description


func add_description(description : Dictionary) -> void:
	_description.merge(description, true)


func get_description() -> Dictionary[String, Array]:
	return _description


func get_attributes() -> Array:
	return _description.keys()


func get_random_noun() -> String:
	if _description.is_empty():
		return ""
	var rand_int = rand_num.randi_range(0, _description.size() - 1)
	return _description.keys()[rand_int].to_lower()


func get_random_adjective(noun : String) -> String:
	if not _description[noun]:
		return ""
	if _description[noun].is_empty():
		return ""
	var rand_int = rand_num.randi_range(0, _description[noun].size() - 1)
	return _description[noun][rand_int]


# Add all attribute nouns to this character
func populate_my_nouns() -> void:
	var empty_description : Dictionary[String, Array]
	for noun in all_attributes.keys():
		var empty_array : Array[String] = []
		empty_description[noun] = empty_array
	_description.merge(empty_description)


func remove_extra_attributes() -> void:
	for key in _description.keys():
		if not all_attributes.has(key):
			_description.erase(key)


func remove_empty_attributes() -> void:
	for key in _description.keys():
		if _description[key].is_empty():
			_description.erase(key)


func get_all_attributes() -> void:
	for attribute in get_tree().get_nodes_in_group("attributes"):
		all_attributes[attribute.get_noun()] = attribute


# Get a statement about this hero
func get_statement_about_me(fact : bool) -> String:
	var noun : String = get_random_noun()
	var adjective : String = get_random_adjective(noun)
	var statement : String = ""
	if noun and adjective: 
		statement = all_attributes[noun].get_random_statement(adjective, fact)
	return statement


func get_resource() -> HeroDescription:
	return _resource


func set_resource() -> void:
	var resource_path = "res://UI/HeroDescriptions/"
	var lower_name = name.to_lower()
	var hero_resource_path = "{folder}{name}_description.tres"
	_resource = load(hero_resource_path.format({
			"folder" : resource_path,
			"name" : lower_name
		})
	)
