extends PanelContainer

var start_time = Time.get_ticks_msec()
@onready var timer_label: Label = %TimerLabel
@onready var replay_button: Button = %ReplayButton
@onready var quit_button: Button = %QuitButton

func _ready() -> void:
	visible = false
	replay_button.pressed.connect(func () -> void:
		get_tree().paused = false
		get_tree().reload_current_scene()
	)
	quit_button.pressed.connect(get_tree().quit)

func open() -> void:
	visible = true
	get_tree().paused = true

	var end_time := Time.get_ticks_msec()
	var total_time_msec = end_time - start_time
	var total_time_s := snappedf(total_time_msec / 1000.0, 0.1)
	timer_label.text = "Time: " + str(total_time_s) + "s"
