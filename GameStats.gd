extends Node

var score := 0 setget set_score
var savedata := {"highscore": 0}
var is_game_started = false setget set_is_game_started
var is_game_over = true setget set_is_game_over

var savegame = File.new()
var save_path = "user://savegame.dat"

signal score_change(value)
signal game_over(value)
signal game_start

func _ready() -> void:
	var error = savegame.open(save_path, File.READ)
	if error != OK:
		create_save()
	savegame.close()

func _input(event: InputEvent) -> void:
	if !is_game_started and !is_game_over:
		if event.is_action_released("jump"):
			self.is_game_started = true

func set_score(value: int):
	score = value
	emit_signal("score_change", score)
	
func set_is_game_started(value: bool) -> void:
	is_game_started = value
	if value:
		score = 0
		emit_signal("game_start")
	
func set_is_game_over(value: bool) -> void:
	is_game_over = value
	if value:
		is_game_started = false
		emit_signal("game_over", score)

func create_save() -> void:
	savegame.open(save_path, File.WRITE)
	savegame.store_var(savedata)
	savegame.close()
	
func save(high_score: int) -> void:
	savedata["highscore"] = high_score
	savegame.open(save_path, File.WRITE)
	savegame.store_var(savedata)
	savegame.close()

func read_savegame() -> Dictionary:
	savegame.open(save_path, File.READ)
	savedata = savegame.get_var()
	savegame.close()
	return savedata
