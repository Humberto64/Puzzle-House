extends Area2D

@export var zone_id: int
@onready var particles := $GPUParticles2D

signal object_dropped_correctly

func _ready():
	add_to_group("drop_zones")
	connect("object_dropped_correctly", _on_correct_drop)

func _on_correct_drop():
	particles.emitting = false
	particles.emitting = true
