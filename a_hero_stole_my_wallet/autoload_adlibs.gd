extends Node

static var adlibs_singular : Array[String] = [
	"They had a {adjective} {noun}" # brown cape - one cape
]

static var adlibs_singular_binary : Array[String] = [
	"They had a {noun}" # beard
]

static var adlibs_plural : Array[String] = [
	"They had {adjective} {noun}" # brown eyes - two eyes
]

static var adlibs_plural_binary : Array[String] = [
	"They had {noun}" # glasses
]

static var adlibs_singular_negative_binary : Array[String] = [
	"They didn't have a {noun}" # beard
]

static var adlibs_plural_negative_binary : Array[String] = [
	"They didn't have {noun}" # glasses
]

var _singular : bool
var _binary : bool

func fetch(adjective : String, attribute : Node) -> Array[String]:
	_singular = attribute.is_singular()
	_binary = attribute.is_binary()
	return determine_appropriate_list(adjective)

func determine_appropriate_list(adjective) -> Array[String]:
	if adjective == "true":
		if _singular:
			return adlibs_singular_binary
		else:
			return adlibs_plural_binary

	if adjective == "false":
		if _singular:
			return adlibs_singular_negative_binary
		else:
			return adlibs_plural_negative_binary

	if _singular:
		return adlibs_singular
	else:
		return adlibs_plural