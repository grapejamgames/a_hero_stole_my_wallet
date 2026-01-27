## A noun with a list of adjectives to represent valid attribute values
## TODO : Statement generator, list of adlibs to add verbs and nouns

class_name Attribute

extends Node

@export var _noun : String
@export var _adjectives : Array[String]

var rand_num = RandomNumberGenerator.new()


func _init(noun : String = "", adjectives = null) -> void:
	_noun = noun
	match typeof(adjectives):
		TYPE_STRING:
			add_adjective(adjectives)
		TYPE_ARRAY:
			add_adjectives(adjectives)


func add_adjective(adjective : String) -> void:
	_adjectives.push_back(adjective)


func add_adjectives(adjectives : Array) -> void:
	for adjective in adjectives:
		add_adjective(adjective)


func get_adjective() -> Array:
	return _adjectives


func get_random_adjective() -> String:
	var rand_int = rand_num.randi_range(0, count_adjectives() - 1)
	return _adjectives[rand_int]


func count_adjectives() -> int:
	return _adjectives.size()


func get_dictionary() -> Dictionary:
	return {_noun : _adjectives}

