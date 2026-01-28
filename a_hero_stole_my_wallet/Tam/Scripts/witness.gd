extends Node2D

@export var witness_traits: Resource

@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready():
	print(witness_traits.name)
	sprite_2d.texture = witness_traits.picture
