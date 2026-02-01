extends Control

signal hero_chosen

@onready var sure_container: PanelContainer = $Sure
@onready var congrats_container: PanelContainer = $Congrats
@onready var sure_label: Label = $Sure/VBoxContainer/Sure
@onready var fail_container: PanelContainer = $Fail
@onready var main = get_node_or_null("/root/Main")
var correct_answer : bool


func _on_yes_pressed() -> void:
	hero_chosen.emit()
	sure_container.hide()
	$Result.show()
	if main:
		$Result/Hero.texture = main.guilty_hero.get_resource().picture
	if correct_answer:
		$Result/JailBars.show()
		$Result/Congrats.show()
	else:
		$Result/Fail.show()


func _on_no_pressed() -> void:
	hide()


func _on_examine_screen_endgame_check() -> void:
	print("main")
	var chosen_hero : String
	if main:
		chosen_hero = main.chosen_hero
	sure_label.text = "Are you sure you want to unmask " + chosen_hero + " as the culprit?"
	show()
