extends Node

var score := 0 setget set_score
var is_game_started = false setget set_is_game_started
var is_game_over = true setget set_is_game_over

signal score_change(value)
signal game_over(value)
signal game_start

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
		emit_signal("game_start")
	
func set_is_game_over(value: bool) -> void:
	is_game_over = value
	if value:
		is_game_started = false
		emit_signal("game_over", score)
