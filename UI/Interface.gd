extends Control

var state = GameStats

onready var gameOverScreen = $GameOverScreen
onready var startGameButton = $GameOverScreen/ButtonArea/StartGameButton
onready var scoreLabel = $Score/ScoreLabel
onready var yourScore = $GameOverScreen/HighScoreArea/YourScore

func _ready() -> void:
	state.connect("game_over", self, "show_game_over_screen")
	state.connect("score_change", self, "update_score")

# When i click the button, game over is set to false
func _on_StartGameButton_pressed() -> void:
	state.is_game_over = false
	gameOverScreen.hide()
	
func show_game_over_screen(score: int) -> void:
	yourScore.text = str(score)
	gameOverScreen.show()

func update_score(score: int) -> void:
	scoreLabel.text = 'Score = ' + str(score)
