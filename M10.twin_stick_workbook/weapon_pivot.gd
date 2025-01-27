extends Node2D

var is_using_gamepad := false

@onready var weapon_anchor: Marker2D = %WeaponAnchor


func _process(_delta: float) -> void:
	var aim_direction := Vector2.ZERO
	aim_direction = global_position.direction_to(get_global_mouse_position())
	if aim_direction.length() > 0.1:
		rotation = aim_direction.angle()
	z_index = 3
	if aim_direction.y < 0.0:
		z_index = 1
