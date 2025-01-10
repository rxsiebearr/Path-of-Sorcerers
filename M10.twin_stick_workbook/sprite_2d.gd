extends Sprite2D

const GODOT_BOTTOM = preload("res://player/godot_bottom.png")
const GODOT_BOTTOM_RIGHT = preload("res://player/godot_bottom_right.png")
const GODOT_RIGHT = preload("res://player/godot_right.png")
const GODOT_UP = preload("res://player/godot_up.png")
const GODOT_UP_RIGHT = preload("res://player/godot_up_right.png")

const UP_LEFT = Vector2.UP + Vector2.LEFT
const UP_RIGHT = Vector2.UP + Vector2.RIGHT
const DOWN_LEFT = Vector2.DOWN + Vector2.LEFT
const DOWN_RIGHT = Vector2.DOWN + Vector2.RIGHT



	var direction_discrete := direction.sign()
	match direction_discrete:
		Vector2.RIGHT, Vector2.LEFT:
			sprite_2d.texture = GODOT_RIGHT 
