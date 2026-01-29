## The character without a graphic. Description is a key/value for noun/verbs
class_name Hero

extends Node

@export var _full_name : String
@export var _description : Dictionary[String, Array]

var attributes : Array[Node]
var rand_num = RandomNumberGenerator.new()


func _init(full_name : String = "", description = null) -> void:
	_full_name = full_name
	match typeof(description):
		TYPE_DICTIONARY:
			add_description(description)


func _ready() -> void:
	attributes = get_tree().get_nodes_in_group("attributes")

	populate_attributes()


func add_description(description : Dictionary) -> void:
	_description.merge(description, true)


func get_description() -> Dictionary[String, Array]:
	return _description


func get_attributes() -> Array:
	return _description.keys()


func get_random_noun() -> String:
	if _description:
		var rand_int = rand_num.randi_range(0, _description.size() - 1)
		return _description.keys()[rand_int]
	return ""


func get_random_adjective(noun : String) -> String:
	if _description:
		var rand_int = rand_num.randi_range(0, _description.size() - 1)
		return _description[noun][rand_int]
	return ""


# Add all attribute nouns to this character but don't populate the adjective
func populate_attributes() -> void:
	var empty_description : Dictionary[String, Array]
	for attribute in attributes:
		var empty_array : Array[String] = []
		empty_description[attribute.noun] = empty_array
	_description.merge(empty_description)


# TODO : Attribute validator
