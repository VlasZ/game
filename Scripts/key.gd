extends Area2D

var collected := false

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and not collected:
		collected = true
		body.has_key = true
		get_node("../UI").show_message("Ключ подобран!")
		
		var tween = create_tween()
		tween.set_parallel(true)
		
		tween.tween_property($Sprite2D, "scale", Vector2(1.6, 1.6), 0.2)
		tween.tween_property($Sprite2D, "modulate", Color(3.0, 3.0, 0.5, 0.0), 0.3)
		
		tween.chain().tween_callback(queue_free).set_delay(0.1)
