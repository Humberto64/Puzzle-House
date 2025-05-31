extends Area2D

signal ObjetoEntro

func _ready():
	connect("area_entered", _on_area_entered)

func _on_area_entered(area):
	if area.has_method("get_id"):
		var id = area.get_id()
		if id in [0,6,7,9,10,11,13,14,15,18,19,20]:
			ObjetoEntro.emit()
