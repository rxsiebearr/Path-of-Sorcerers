extends Node2D

@export var bullet_scene: PackedScene = preload("res://bullet.tscn")
@export var random_angle := PI/12.0
@export var max_range = 700.0
@export var max_bullet_speed = 1000.0

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
func shoot():
	var bullet: Node = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = global_position
	bullet.global_rotation = global_rotation
	bullet.max_range = max_range
	bullet.speed = max_bullet_speed
	bullet.rotation += randf_range(-random_angle / 2.0, random_angle / 2.0)
