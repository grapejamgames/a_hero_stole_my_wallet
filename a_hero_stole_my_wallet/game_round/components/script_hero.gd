## The character without a graphic. Description is a key/value for noun/verbs
class_name Hero

extends Node

@export var _full_name : String
@export var _description : Dictionary[String, Array]

var my_statement : String
var all_attributes : Dictionary[String, Node]  # All attributes
var rand_num = RandomNumberGenerator.new()


func _init(full_name : String = "", description = null) -> void:
	_full_name = full_name
	match typeof(description):
		TYPE_DICTIONARY:
			add_description(description)


func _ready() -> void:
	get_all_attributes()
	if all_attributes.is_empty():
		print("There are no attributes for this round")
		return

	populate_attributes()


func description_to_lower() -> void:
	var lower_description : Dictionary[String, Array]
	for key in _description.keys():
		# lowercase the values
		for i in range(_description[key].size()):
			_description[key][i] = _description[key][i].to_lower()
		# lowercase the key
		lower_description[key.lower] = _description[key]	
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
	if _description[noun].is_empty():
		return ""
	var rand_int = rand_num.randi_range(0, _description[noun].size() - 1)
	return _description[noun][rand_int]


# Add all attribute nouns to this character but don't populate the adjective
func populate_attributes() -> void:
	var empty_description : Dictionary[String, Array]
	for noun in all_attributes.keys():
		var empty_array : Array[String] = []
		empty_description[noun] = empty_array
	_description.merge(empty_description)


func get_all_attributes() -> void:
	for attribute in get_tree().get_nodes_in_group("attributes"):
		if attribute.is_valid:
			all_attributes[attribute.get_noun()] = attribute


# Get a statement about this hero
func get_statement_about_me(fact : bool) -> String:
	var noun : String = get_random_noun()
	var adjective : String = get_random_adjective(noun)
	var statement : String = ""
	if noun and adjective: 
		statement = all_attributes[noun].get_random_statement(adjective, fact)
	return statement


# TODO : Attribute validator
