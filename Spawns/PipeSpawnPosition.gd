extends Position2D

export var spawn_range = {"min": 0, "max": 0}
export(float) var spawn_rate = 4

var pipePacked = preload("res://Pipes/Pipe.tscn")

func _ready() -> void:
	$Timer.wait_time = spawn_rate
	spawn_range.max = -spawn_range.max
	spawn_range.min = -spawn_range.min
	randomize()


# Spawn a new pipe
func _on_Timer_timeout() -> void:
	var spawn_position = position
	spawn_position.y += rand_range(spawn_range.min, spawn_range.max)
	var pipe_instance = pipePacked.instance()
	pipe_instance.position = spawn_position
	get_tree().root.add_child(pipe_instance)
