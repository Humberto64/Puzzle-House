extends StaticBody2D
var accionjugador = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.Escritoriocompletado == true:
		free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if accionjugador == true:
		get_tree().change_scene_to_file("res://Escenas/Main.tscn")
		accionjugador = false


func _on_player_accion() -> void:
	accionjugador = true
