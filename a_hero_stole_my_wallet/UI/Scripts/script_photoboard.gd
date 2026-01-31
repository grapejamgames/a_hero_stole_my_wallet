extends Control
@onready var center_container: CenterContainer = $CenterContainer
@onready var center_container_2: CenterContainer = $CenterContainer2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_examine_polaroid_show_grid()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_hero_headshot_hide_grid() -> void:
	#print("gameplay control at work")
	center_container.hide()
	center_container_2.show()


func _on_examine_polaroid_show_grid() -> void:
	#print("gameplay control at work")
	center_container_2.hide()
	center_container.show()
