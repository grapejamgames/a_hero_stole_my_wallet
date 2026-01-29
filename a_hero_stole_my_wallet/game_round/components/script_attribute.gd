## A noun with a list of adjectives to represent valid attribute values
class_name Attribute

extends Node

static var adlibs_plural : Array[String] = [
	"They had {adjective} {noun}" # brown eyes - two eyes
]

static var adlibs_singular : Array[String] = [
	"They had a {adjective} {noun}" # brown cape - one cape
]

# static var adlibs_missing_noun
# 	"they didn't have a {noun}"

# static var adlibs_binary_yes :
# 	"They had {noun}"


# static var adlibs_binary_no :
# 	"They had no {noun}"

@export var _noun : String
@export var _adjectives : Array[String]
@export var _singular : bool = true

var rand_num = RandomNumberGenerator.new()
var adlibs : Array[String]
var is_valid : bool = true


func _init(noun : String = "", adjectives = null) -> void:
	_noun = noun.to_lower()
	match typeof(adjectives):
		TYPE_STRING:
			add_adjective(adjectives)
		TYPE_ARRAY:
			add_adjectives(adjectives)
	
	if _singular:
		adlibs = adlibs_singular
	else:
		adlibs = adlibs_plural


func _ready() -> void:
	if not _noun:
		_noun = name.to_lower()
	
	if _adjectives.is_empty():
		print(_noun, " has no adjectives")
		remove_from_group("attributes")
		is_valid = false
		return
	
	if _adjectives.size() == 1:
		print(_noun, " has one adjectives")
		remove_from_group("attributes")
		is_valid = false
		return

	adjectives_to_lower()


func get_noun() -> String:
	return _noun


func adjectives_to_lower() -> void:
	for i in range(_adjectives.size()):
		_adjectives[i] = _adjectives[i].to_lower()


func add_adjective(adjective : String) -> void:
	_adjectives.push_back(adjective)


func add_adjectives(adjectives : Array) -> void:
	for adjective in adjectives:
		add_adjective(adjective)


func get_adjective() -> Array:
	return _adjectives


func get_random_adjective() -> String:
	if _adjectives.is_empty():
		return ""
	var rand_int = rand_num.randi_range(0, _adjectives.size() - 1)
	return _adjectives[rand_int]


func get_random_statement(adjective : String, fact : bool) -> String:
	if not fact:
		adjective = get_different_adjective(adjective)
	var rand_int : int = rand_num.randi_range(0, adlibs.size() - 1)
	var random_adlib : String = adlibs[rand_int]
	var statement = random_adlib.format({_noun : adjective})
	print(statement)
	return statement


func get_different_adjective(adjective : String) -> String:
	if _adjectives.is_empty() or _adjectives.size() < 2:
		return ""
	var old : String = adjective
	var new : String = adjective
	while new == old:
		new = get_random_adjective()
	return new
