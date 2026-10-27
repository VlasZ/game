extends Area2D

@onready var victory_label: Label = $"../UI/CenterContainer/VictoryLabel"

@onready var restart_button: Button = $"../UI/RestartButton"

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	restart_button.pressed.connect(_on_restart_pressed)

func _on_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		return

	if body.has_key:
		victory_label.visible = true
		restart_button.visible = true
		print("Победа!")
	else:
		print("Дверь заперта. Найди ключ!")

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
