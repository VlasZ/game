
extends CanvasLayer

@onready var hint_label: Label = $HintLabel
@onready var hint_timer: Timer = $HintTimer

func _ready() -> void:
	hint_label.hide()
	hint_timer.timeout.connect(_on_hint_timer_timeout)

func show_message(message: String) -> void:
	hint_label.text = message
	hint_label.show()
	hint_timer.start(2.0)

func _on_hint_timer_timeout() -> void:
	hint_label.hide()
