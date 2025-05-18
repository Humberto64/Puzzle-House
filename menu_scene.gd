extends Node2D

func _listo() -> void:
	$CenterContainer/Menudeopciones/PantallaCompleta.button_pressed = true if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN else false
	$CenterContainer/Menudeopciones/volslider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://jogo.tscn")

func _on_opciones_pressed() -> void:
	$CenterContainer/Botones.visible=false
	$CenterContainer/Menudeopciones.visible=true

func _on_creditos_pressed() -> void:
	$CenterContainer/Botones.visible=false
	$CenterContainer/Creditosmenu.visible=true

func _on_salir_pressed() -> void:
	get_tree().quit()


func _on_atrás_pressed() -> void:
	$CenterContainer/Botones.visible=true
	$CenterContainer/Menudeopciones.visible=false
	$CenterContainer/Creditosmenu.visible=false
	
func _on_pantalla_completa_toggled(toggled_off: bool) -> void:
	if toggled_off:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)

func _on_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
