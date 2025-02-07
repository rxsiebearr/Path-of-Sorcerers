class_name ItemSpeed extends Item

@export var speed_amount := 5000


func use(player: Player) -> void:
	player.speed = speed_amount
