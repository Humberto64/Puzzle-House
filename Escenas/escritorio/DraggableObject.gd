extends Area2D

@export var correct_zone_id: int
var original_position := Vector2.ZERO
var dragging := false
var tween: Tween
var already_placed := false

func _ready():
	await get_tree().process_frame
	original_position = global_position
	z_index = 0

func _process(_delta):
	if dragging:
		global_position = get_global_mouse_position()

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
			z_index = 100
			_start_wobble()
		else:
			dragging = false
			_stop_wobble()
			z_index = 0
			_check_drop()

func _start_wobble():
	_stop_wobble()
	rotation = 0
	_wobble_cycle()

func _wobble_cycle():
	tween = create_tween()
	tween.tween_property(self, "rotation", deg_to_rad(5), 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "rotation", deg_to_rad(-5), 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_callback(Callable(self, "_wobble_cycle"))

func _stop_wobble():
	if tween:
		tween.kill()
	rotation = 0

func _check_drop():
	for zone in get_tree().get_nodes_in_group("drop_zones"):
		var shape_node = zone.get_node("CollisionShape2D")
		var shape: RectangleShape2D = shape_node.shape

		var transform = shape_node.global_transform
		var local_point = transform.affine_inverse() * global_position

		# Verifica si el punto está dentro del rectángulo
		if abs(local_point.x) <= shape.size.x / 2 and abs(local_point.y) <= shape.size.y / 2:
			if zone.zone_id == correct_zone_id:
				if not already_placed:
					already_placed = true
					zone.emit_signal("object_dropped_correctly")
				_stop_wobble()
				z_index = 100
				return
	# Si no coincidió con ninguna zona
	_return_to_origin()
	z_index = 0
func _return_to_origin():
	_stop_wobble()
	tween = create_tween()
	tween.tween_property(self, "global_position", original_position, 0.3)
	tween.tween_property(self, "rotation", 0.0, 0.3)
	z_index = 0
