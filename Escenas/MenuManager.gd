# MenuManager.gd
extends Node

var menu_escena: PackedScene = preload("res://Escenas/menu_configuracion.tscn")
var menu_instancia: Node = null

func _ready():
	# Instanciar pero no mostrar aún
	menu_instancia = menu_escena.instantiate()
	menu_instancia.visible = false
	get_tree().root.add_child(menu_instancia)  # Lo agrega a la raíz del árbol de nodos
	menu_instancia.set_as_top_level(true)  # Para que no se vea afectado por cámaras, etc.
	menu_instancia.z_index = 110  # ← Mueve el menú al frente de todo

func _input(event):
	
	if event.is_action_pressed("ui_config"):  # Define esta acción en el Input Map
		print("listo")
		if menu_instancia:
			menu_instancia.visible = !menu_instancia.visible
