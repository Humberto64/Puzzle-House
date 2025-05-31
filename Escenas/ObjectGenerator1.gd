extends Node2D

@export var sprite_sheet: Texture2D
@export var zone_id: int
@export var tile_size := Vector2i(64, 64)
@export var number_of_objects := 3
@onready var container := $"../DragContainer"

var used_tiles := []

func _ready():
	_generate_objects()

func _generate_objects():
	var cols := sprite_sheet.get_width() / tile_size.x
	var rows := sprite_sheet.get_height() / tile_size.y
	var total := cols * rows

	for i in number_of_objects:
		var index := randi() % total
		while index in used_tiles:
			index = randi() % total
		used_tiles.append(index)

		var x = index % cols
		var y = index / cols

		var region := Rect2(Vector2i(x, y) * tile_size, tile_size)
		var atlas := AtlasTexture.new()
		atlas.atlas = sprite_sheet
		atlas.region = region

		var obj = preload("res://Escenas/DraggableObject.tscn").instantiate()
		obj.get_node("Sprite2D").texture = atlas
		obj.correct_zone_id = zone_id
		container.add_child(obj)
		obj.global_position = self.global_position + Vector2(randf() * 400, randf() * 100)
