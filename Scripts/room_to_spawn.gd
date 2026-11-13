extends Area2D

@export_file("*.tscn") var room_path: String
@export var spawn_name: String

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var world = get_tree().current_scene.call_deferred("change_room", room_path, spawn_name)
