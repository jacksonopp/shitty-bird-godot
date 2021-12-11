extends Area2D

export var move_speed = 10

var stats = GameStats

func _ready() -> void:
	stats.connect("game_over", self, "on_game_over")

func _physics_process(_delta: float) -> void:
	if stats.is_game_started:
		position.x -= move_speed

func on_game_over(_unused) -> void:
	queue_free()
