@tool
class_name Pickup extends Area2D

@export var item: Item = null: set = set_item

@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var audio_stream_player: AudioStreamPlayer2D = %AudioStreamPlayer2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	set_item(item)

	animation_player.play("idle")
	body_entered.connect(func (body: Node2D) -> void:
		if body is Player:
			item.use(body)
		#animation_player.play("destroy")
		set_deferred("monitoring", false)
		audio_stream_player.play()
		animation_player.animation_finished.connect(func (_animation_name: String) -> void:
			queue_free()
		)
	)


func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	if item == null:
		warnings.append("The pickup has no item assigned. Please assign an item to the pickup in the inspector.")
	return warnings


func set_item(value: Item) -> void:
	item = value
	if sprite_2d != null:
		sprite_2d.texture = item.texture
	if audio_stream_player != null:
		audio_stream_player.stream = item.sound_on_pickup
