extends Node2D
signal Objetoentro
var Desorden = 9

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mostrar_instrucciones()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Desorden == 0:
		Global.Estantecompletado = true
		get_tree().change_scene_to_file("res://Escenas/nivel_cuarto.tscn")


func mostrar_instrucciones():
	$ColorRect.visible = true
	await get_tree().create_timer(5.0).timeout
	$ColorRect.visible = false

func _on_area_basurero_objeto_entro() -> void:
	Desorden = Desorden - 1



func _on_area_estante_objeto_entro() -> void:
	Desorden = Desorden - 1


func _on_area_armario_objeto_entro() -> void:
	Desorden = Desorden - 1
