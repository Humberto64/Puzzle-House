extends Area2D


var id 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var padre = get_parent()
	id = padre.valor


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func get_id():
	return id
