class_name Mob extends CharacterBody2D

@export var max_speed := 250.0
@export var acceleration := 700.0
@export var health := 3: set = set_health

func set_health(new_health: int) -> void:
	health = new_health
	if health <= 0:
		die()
	
func die() -> void:
	queue_free()
	
var player = null
@onready var area_2d: Area2D = %Area2D

func _ready() -> void:
	area_2d.body_entered.connect(func(body: Node) -> void:
		if body is Player:
			player = body
		print("enter")
		)
	area_2d.body_exited.connect(func(body: Node) -> void:
		if body is Player:
			player = null
			print("exit")
		)
func _physics_process(delta: float) -> void:
	if player == null:
		velocity = velocity.move_toward(Vector2.ZERO, acceleration * delta)
	else:
		var direction := global_position.direction_to(player.global_position)
		var distance := global_position.distance_to(player.global_position)
		var speed := max_speed if distance > 120.0 else max_speed * distance / 120.0
		var desired_velocity := direction * speed
		velocity = velocity.move_toward(desired_velocity, acceleration * delta)
	move_and_slide()
		
