extends Node2D

@onready var prompt: Label = $Prompt
var player_in_range := false
var is_opened := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	prompt.hide()

func _process(delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("interact"):
		interact()

func _on_interaction_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = true

		if is_opened:
			prompt.text = "Пусто..."
		else:
			prompt.text = "E — открыть"
		prompt.show()

func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = false
		prompt.hide()

func interact() -> void:
	if is_opened:
		return
	is_opened = true
	prompt.text = "В сундуке ничего \n не оказалось!"
	prompt.show()
	print("Сундук открыт")
	
