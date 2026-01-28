extends Resource
class_name WitnessTraits

@export var name : String
@export var picture : Texture
@export var eye_color : eye_colors
@export var hair_color : hair_colors
@export var facial_hair : bool
@export var makeup : bool
@export var facial_accessory : facial_accessories
@export var costume_color : costume_colors
@export var cape : cape_colors
@export var pet : pet_types

enum eye_colors {
	Blue,
	Brown,
	Green
}

enum hair_colors {
	Black,
	Blond,
	Brown
}

enum facial_accessories{
	Glasses,
	Mask,
	None
}

enum costume_colors{
	Blue,
	Green,
	Red
}

enum cape_colors{
	Cyan,
	Yellow,
	None
}

enum pet_types{
	Cat,
	Dog,
	None
}
