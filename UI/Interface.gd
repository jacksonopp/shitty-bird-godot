extends Control

var state = GameStats

onready var gameOverScreen = $GameOverScreen
onready var startGameButton = $GameOverScreen/ButtonArea/StartGameButton
onready var scoreLabel = $Score/ScoreLabel
onready var yourScore = $GameOverScreen/HighScoreArea/YourScore
onready var pressSpace = $PressSpace

func _ready() -> void:
	state.connect("game_over", self, "show_game_over_screen")
	state.connect("score_change", self, "update_score")
	
func _process(delta: float) -> void:
	if !state.is_game_over and !state.is_game_started:
		pressSpace.show()
	else:
		pressSpace.hide()

# When i click the button, game over is set to false
func _on_StartGameButton_pressed() -> void:
	state.is_game_over = false
	gameOverScreen.hide()
	
func show_game_over_screen(score: int) -> void:
	yourScore.text = str(score)
	gameOverScreen.show()

func update_score(score: int) -> void:
	scoreLabel.text = 'Score = ' + str(score)
