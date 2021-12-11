extends Spawner

onready var playerPacked = preload("res://Player/Player.tscn")
var stats = GameStats
var player_exists = false

func _ready() -> void:
	stats.connect("game_over", self, "reset_spawner")

func _process(_delta: float) -> void:
#	If the player hasn't been spawned and the game over screen isn't visible
	if !player_exists and !stats.is_game_over:
		player_exists = true
		spawn_player()

func spawn_player() -> void:
	spawn(playerPacked, position)

func reset_spawner(_unused) -> void:
	player_exists = false
