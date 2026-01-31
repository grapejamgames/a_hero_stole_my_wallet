## A noun with a list of adjectives to represent valid attribute values
class_name Attribute

extends Node

@export var _noun : String
@export var _adjectives : Array[String]
@export var _singular : bool = true
@export var _binary : bool = false

var rand_num = RandomNumberGenerator.new()


func _init(noun : String = "", adjectives = null, singular : bool = true) -> void:
	_noun = noun.to_lower()
	_singular = singular
	match typeof(adjectives):
		TYPE_STRING:
			add_adjective(adjectives)
		TYPE_ARRAY:
			add_adjectives(adjectives)


func _ready() -> void:
	if not _noun:
		_noun = name.to_lower()

	adjectives_to_lower()


func get_noun() -> String:
	return _noun


func is_binary() -> bool:
	return _binary


func is_singular() -> bool:
	return _singular


func adjectives_to_lower() -> void:
	for i in range(_adjectives.size()):
		_adjectives[i] = _adjectives[i].to_lower()


func add_adjective(adjective : String) -> void:
	_adjectives.push_back(adjective)


func add_adjectives(adjectives : Array) -> void:
	for adjective in adjectives:
		add_adjective(adjective)


func get_adjectives() -> Array:
	return _adjectives


func get_random_adjective() -> String:
	if _adjectives.is_empty():
		return ""
	var rand_int = rand_num.randi_range(0, _adjectives.size() - 1)
	return _adjectives[rand_int]


func get_random_statement(adjective : String, fact : bool) -> String:
	if not fact:
		adjective = get_different_adjective(adjective)
	var adlibs = Adlibs.fetch(adjective, self)
	var rand_int : int = rand_num.randi_range(0, adlibs.size() - 1)
	var vowel : String = ""
	return adlibs[rand_int].format({
		"vowel": vowel,
		"noun" : _noun,
		"adjective" : adjective
	})


func get_different_adjective(old : String) -> String:
	if _adjectives.is_empty() or _adjectives.size() < 2:
		return ""	

	if _adjectives.size() == 2:
		for adjective in _adjectives:
			if adjective != old:
				return adjective

	var new : String = old
	while new == old:
		new = get_random_adjective()
	return new


func validate() -> void:
	if _adjectives.has("true"):
		if not _adjectives.has("false"):
			_adjectives.push_back("false")

	if _adjectives.has("false"):
		if not _adjectives.has("true"):
			_adjectives.push_back("true")
