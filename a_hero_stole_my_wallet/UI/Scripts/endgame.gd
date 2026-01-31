extends Control
@onready var sure_container: PanelContainer = $Sure
@onready var congrats_container: PanelContainer = $Congrats
@onready var sure_label: Label = $Sure/VBoxContainer/Sure
@onready var fail_container: PanelContainer = $Fail
@onready var canvas_layer_2: CanvasLayer = $".."



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sure_container.hide()
	congrats_container.hide()
	fail_container.hide()


func _on_examine_polaroid_endgame(name: String) -> void:
	sure_label.text = "Are you sure you want to unmask " + name + " as the culprit?"
	sure_container.show()
	canvas_layer_2.show()
	print("endgame!")


func _on_yes_pressed() -> void:
	print("Yes")


func _on_no_pressed() -> void:
	print("No")
	sure_container.hide()
