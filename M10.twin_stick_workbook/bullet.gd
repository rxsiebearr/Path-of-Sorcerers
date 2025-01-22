extends Area2D
@onready var bullet: Area2D = $"."
@export var speed := 1000
@export var max_range := 700
var distance_traveled = 0.0

func _ready() -> void:
	bullet.body_entered.connect(func (body: Node) -> void:
		if body is Mob:
			body.health -= 1
			destroy()
			
	)
	
func _physics_process(delta: float) -> void:
	var distance = speed * delta
	var direction = Vector2.RIGHT.rotated(rotation) * distance
	position += direction
	distance_traveled += distance
	if distance_traveled > max_range:
		destroy()
		
func destroy():
	queue_free()
