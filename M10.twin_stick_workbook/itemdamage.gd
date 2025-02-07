class_name ItemDamage extends Item

@export var damage_amount := 2


func use(player: Player) -> void:
	player.health -= damage_amount
