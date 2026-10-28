
extends CharacterBody2D

@export var speed: float = 300.0
var has_key: bool = false
var game_over: bool = false

func _physics_process(_delta: float) -> void:
	if game_over:
		velocity = Vector2.ZERO
		return
		
	var direction := Input.get_vector(
		"ui_left", "ui_right",
		"ui_up", "ui_down"
	)

	velocity = direction * speed
	move_and_slide()
