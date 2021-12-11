extends CanvasLayer

onready var scoreLabel := $ScoreLabel

var stats := GameStats

func _ready() -> void:
# warning-ignore:return_value_discarded
	stats.connect("score_change", self, "on_score_change")

func on_score_change(value) -> void:
	scoreLabel.text = "Score = " + str(value)
