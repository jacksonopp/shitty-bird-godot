extends Spawner

export var spawn_range = {"min": 0, "max": 0}
export(float) var spawn_rate = 4

onready var timer: Timer = $Timer

var stats = GameStats
var pipePacked = preload("res://Pipes/Pipe.tscn")

func _ready() -> void:
	stats.connect("game_over", self, "stop_timer")
	stats.connect("game_start", self, "start_timer")
	randomize()
	timer.wait_time = spawn_rate
	spawn_range.max = -spawn_range.max
	spawn_range.min = -spawn_range.min

# Spawn a new pipe
func _on_Timer_timeout() -> void:
	var spawn_position = position
	spawn_position.y += rand_range(spawn_range.min, spawn_range.max)
	print("before spawn")
	spawn(pipePacked, spawn_position)

func start_timer() -> void:
	timer.start()
	
func stop_timer(_unused) -> void:
	timer.stop()
