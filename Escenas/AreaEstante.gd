extends Area2D

signal ObjetoEntro

func _ready():
	connect("area_entered", _on_area_entered)

func _on_area_entered(area):
	if area.has_method("get_id"):
		var id = area.get_id()
		if id in [2,3,8,16,17]:
			ObjetoEntro.emit()
