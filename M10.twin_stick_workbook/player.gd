class_name Player extends CharacterBody2D

@export var speed := 500.0
@export var drag_factor := 10.0
@export var max_health := 10
var health := max_health: set = set_health
@onready var health_bar: ProgressBar = %"Health Bar"

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var desired_velocity := speed * direction
	var steering := desired_velocity - velocity
	velocity += steering * drag_factor * _delta
	move_and_slide()
	
func set_health(new_health: int) -> void:
	var previous_health := health
	health = clampi(new_health, 0, max_health)
	health_bar.value = health

	if health == 0:
		die()

func die() -> void:
	queue_free()
