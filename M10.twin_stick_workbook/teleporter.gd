extends Area2D
@onready var teleporter: Area2D = $"."

func _ready() -> void:
	teleporter.body_entered.connect(func (body: Node) -> void:
		if body is Player:
			end_menu.open()
	)
