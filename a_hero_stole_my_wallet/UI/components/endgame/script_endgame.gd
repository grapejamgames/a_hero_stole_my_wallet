extends Control

signal hero_chosen

@onready var sure_container: PanelContainer = $Sure
@onready var congrats_container: PanelContainer = $Congrats
@onready var sure_label: Label = $Sure/VBoxContainer/Sure
@onready var fail_container: PanelContainer = $Fail
var correct_answer : bool


func _on_examine_polaroid_endgame(name: String) -> void:
	sure_label.text = "Are you sure you want to unmask " + name + " as the culprit?"
	show()


func _on_yes_pressed() -> void:
	hero_chosen.emit()
	sure_container.hide()
	if correct_answer:
		congrats_container.show()
	else:
		fail_container.show()


func _on_no_pressed() -> void:
	hide()
