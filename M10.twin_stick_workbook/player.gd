extends CharacterBody2D

@export var speed := 500.0
@export var drag_factor := 10.0

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var desired_velocity := speed * direction
	var steering := desired_velocity - velocity
	velocity += steering * drag_factor * _delta
	move_and_slide()
	
	
