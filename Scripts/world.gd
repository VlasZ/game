extends Node2D

@onready var room_container = $Room
@onready var player = $Player
var spawn_points: Dictionary = {}

func _ready() -> void:
	await change_room("res://Scenes/start_place.tscn", "SpawnPoint1")
	print(spawn_points)

func change_room(room_path: String, spawn: String) -> void:
	spawn_points.clear()
	for child in room_container.get_children():
		child.queue_free()

	await get_tree().process_frame

	var new_room = load(room_path).instantiate()
	room_container.add_child(new_room)
	move_player(spawn)

func move_player(spawn: String) -> void:
	print("Ищу точку: ", spawn)
	print("Доступные точки: ", spawn_points.keys())
	if spawn_points.has(spawn):
		player.global_position = spawn_points[spawn]
	else:
		print("ОШИБКА: такой точки появления нет!")
