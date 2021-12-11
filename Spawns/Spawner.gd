extends Position2D

class_name Spawner

func spawn(asset: PackedScene, spawn_position: Vector2) -> void:
	var instance = asset.instance()
	instance.position = spawn_position
	get_tree().root.add_child(instance)
