## Todo. Use this instead of modifying heroes individually
## There is no parser for this data in the heroes yet.
## Name and picture are currently used.

extends Resource

class_name HeroDescription

@export var name : String
@export var picture : Texture
@export var headshot : Texture
@export var eye_color : eye_colors
@export var hair_color : hair_colors
@export var costume_color : costume_colors
@export var facial_hair : bool
@export var makeup : bool
@export var mask : bool
@export var glasses : bool
@export var cape : bool
@export var pet : pet_type

enum eye_colors{
	blue,
	brown,
	green
}

enum hair_colors{
	black,
	blond,
	brown
}

enum costume_colors{
	blue,
	green,
	red
}

enum pet_type{
	none,
	cat,
	dog
}
