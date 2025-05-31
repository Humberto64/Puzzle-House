extends Node2D

var total_to_match := 9 # o la cantidad total de objetos
var matched := 0

func _ready():
	mostrar_instrucciones()
	for zone in get_tree().get_nodes_in_group("drop_zones"):
		zone.connect("object_dropped_correctly", _on_object_matched)

func _on_object_matched():
	matched += 1
	print(matched)
	print("Objetos correctos:", matched)
	if matched == total_to_match:
		Global.Escritoriocompletado = true
		get_tree().change_scene_to_file("res://Escenas/nivel_cuarto.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/nivel_cuarto")
	Global.Escritoriocompletado = true

func mostrar_instrucciones():
	$ColorRect.visible = true
	await get_tree().create_timer(5.0).timeout
	$ColorRect.visible = false
