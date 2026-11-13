extends Marker2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().current_scene.spawn_points[name] = global_position
	print(get_tree().current_scene.spawn_points)
