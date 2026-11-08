extends Node2D

@onready var room_container = $Room

func change_room(room_path: String) -> void:
	for child in room_container.get_children():
		child.queue_free()

	await get_tree().process_frame

	var new_room = load(room_path).instantiate()
	room_container.add_child(new_room)

	await get_tree().process_frame

	var spawn_point = new_room.get_node("SpawnPoint")
	GameManager.player.global_position = spawn_point.global_position
