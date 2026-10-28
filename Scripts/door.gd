extends Area2D

@onready var restart_menu: VBoxContainer = $"../UI/VBoxContainer"
@onready var door_sprite: Sprite2D = $"Sprite2D"

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	restart_menu.get_child(1).pressed.connect(_on_restart_pressed)
	restart_menu.get_child(2).pressed.connect(_on_quit_pressed)

func _on_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		return

	if body.has_key:
		door_sprite.modulate = Color(0.4, 0.5, 0.5)
		body.game_over = true
		restart_menu.visible = true
		get_node("../UI").show_message("Победа!")
	else:
		get_node("../UI").show_message("Дверь заперта. Найди ключ!")

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
	
func _on_quit_pressed() -> void:
	get_tree().quit()
