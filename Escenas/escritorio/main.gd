extends Node2D

var total_to_match := 9 # o la cantidad total de objetos
var matched := 0

func _ready():
	for zone in get_tree().get_nodes_in_group("drop_zones"):
		zone.connect("object_dropped_correctly", _on_object_matched)

func _on_object_matched():
	matched += 1
	print("Objetos correctos:", matched)
	if matched == total_to_match:
		$WinScreen.visible = true


func _on_button_pressed() -> void:
	get_tree().quit()
