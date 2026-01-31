extends Node

static var adlibs_singular : Array[String] = [
	"They had a{vowel} {adjective} {noun}",
	"I think they had a{vowel} {adjective} {noun}",
	"I swear I saw a{vowel} {adjective} {noun} on them",
	"It looked like a{vowel} {adjective} {noun}",
	"Pretty sure there was a{vowel} {adjective} {noun}",
	"I could’ve sworn they carried a{vowel} {adjective} {noun}",
	"Did you notice the {adjective} {noun} they had",
	"I remember seeing a{vowel} {adjective} {noun}",
	"They were sporting a{vowel} {adjective} {noun}",
	"They showed up with a{vowel} {adjective} {noun}",
	"Hard to miss that {adjective} {noun} they had",
	"I caught a glimpse of a{vowel} {adjective} {noun}",
	"They flashed a{vowel} {adjective} {noun} for a moment",
	"I’m telling you, they had a{vowel} {adjective} {noun}",
	"Someone mentioned they had a{vowel} {adjective} {noun}",
	"I thought I saw a{vowel} {adjective} {noun} on them",
	"It might’ve been a{vowel} {adjective} {noun}",
	"They definitely wore a{vowel} {adjective} {noun}",
	"From what I saw, it was a{vowel} {adjective} {noun}"
]


static var adlibs_plural : Array[String] = [
	"They had {adjective} {noun}",
	"I think they had {adjective} {noun}",
	"I swear I saw {adjective} {noun} on them",
	"It looked like {adjective} {noun}",
	"Pretty sure they were wearing {adjective} {noun}",
	"I could’ve sworn they had {adjective} {noun}",
	"Did you notice the {adjective} {noun} they had",
	"I remember seeing {adjective} {noun}",
	"They were sporting {adjective} {noun}",
	"They showed up with {adjective} {noun}",
	"Hard to miss those {adjective} {noun}",
	"I caught a glimpse of {adjective} {noun}",
	"They flashed {adjective} {noun} for a moment",
	"I’m telling you, they had {adjective} {noun}",
	"Someone mentioned they had {adjective} {noun}",
	"I thought I saw {adjective} {noun} on them",
	"It might’ve been {adjective} {noun}",
	"They definitely had {adjective} {noun}",
	"From what I saw, it was {adjective} {noun}"
]

static var adlibs_singular_binary : Array[String] = [
	"They had a{vowel} {noun}",
	"I think they had a{vowel} {noun}",
	"Pretty sure they had a{vowel} {noun}",
	"I swear I saw a{vowel} {noun}",
	"It looked like a{vowel} {noun}",
	"I caught a glimpse of a{vowel} {noun}",
	"Someone mentioned they had a{vowel} {noun}",
	"I could’ve sworn they were sporting a{vowel} {noun}",
	"They showed up with a{vowel} {noun}",
	"I remember seeing a{vowel} {noun}",
	"Hard to miss a{vowel} {noun} like that",
	"They were definitely wearying a{vowel} {noun}",
	"From what I saw, it was a{vowel} {noun}",
	"I thought I saw a{vowel} {noun} on them",
	"They flashed a{vowel} {noun} for a moment",
	"It might’ve been a{vowel} {noun}",
	"They seemed to have a{vowel} {noun}",
	"I’m telling you, there was a{vowel} {noun}"
]

static var adlibs_plural_binary : Array[String] = [
	"They had {noun}",
	"I think they had {noun}",
	"Pretty sure they had {noun}",
	"I swear I saw {noun} on them",
	"It looked like they had {noun}",
	"I caught a glimpse of {noun}",
	"They definitely had {noun}",
	"I remember seeing {noun}",
	"They showed up with {noun}",
	"They were sporting {noun}",
	"Hard to miss {noun} like that",
	"Someone mentioned they had {noun}",
	"I could’ve sworn they were waring {noun}",
	"From what I saw, they had {noun}",
	"They flashed {noun} for a moment",
	"I thought I saw {noun} on them",
	"They seemed to have {noun}",
	"I'm telling you, they had {noun}",
	"There was no mistaking those {noun}",
	"They walked in with {noun}"
]

static var adlibs_singular_negative_binary : Array[String] = [
	"They didn't have a{vowel} {noun}",
	"I don't think they had a{vowel} {noun}",
	"Pretty sure they didn't have a{vowel} {noun}",
	"I swear they didn't have a{vowel} {noun}",
	"It didn't look like they had a{vowel} {noun}",
	"I never saw a{vowel} {noun} on them",
	"They definitely weren't wearing a{vowel} {noun}",
	"I could've sworn they lacked a{vowel} {noun}",
	"Someone said they didn't have a{vowel} {noun}",
	"I didn't notice a{vowel} {noun} on them",
	"There wasn't a{vowel} {noun} anywhere on them",
	"I’m telling you, no {noun}",
	"It was clear they didn't have a{vowel} {noun}",
	"I kept looking, but no {noun}",
	"They showed up without a{vowel} {noun}",
	"I thought they'd have a{vowel} {noun}, but nope",
	"From what I saw, no {noun}",
	"They seemed to be missing a{vowel} {noun}",
	"They were definitely without a{vowel} {noun}"
]

static var adlibs_plural_negative_binary : Array[String] = [
	"They didn't have {noun}",
	"I don't think they had {noun}",
	"Pretty sure they didn't have {noun}",
	"I swear they didn't have {noun}",
	"It didn't look like they had {noun}",
	"I never saw any {noun} on them",
	"They definitely weren't wearing {noun}",
	"I could've sworn they lacked {noun}",
	"Someone said they didn't have {noun}",
	"I didn't notice any {noun} on them",
	"There weren't any {noun} anywhere on them",
	"I'm telling you, no {noun}",
	"It was clear they didn't have {noun}",
	"I kept looking, but no {noun}",
	"They showed up without {noun}",
	"I thought they'd have {noun}, but nope",
	"From what I saw, no {noun}",
	"They seemed to be missing {noun}",
	"They were definitely without {noun}"
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