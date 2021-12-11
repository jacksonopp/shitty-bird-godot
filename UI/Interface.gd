extends Control

var state = GameStats

onready var gameOverScreen = $GameOverScreen
onready var startGameButton = $GameOverScreen/ButtonArea/StartGameButton
onready var scoreLabel = $Score/ScoreLabel
onready var highScore = $GameOverScreen/HighScoreArea/HighScore
onready var yourScore = $GameOverScreen/HighScoreArea/YourScore
onready var pressSpace = $PressSpace

func _ready() -> void:
	state.connect("game_over", self, "show_game_over_screen")
	state.connect("score_change", self, "update_score")
	show_game_over_screen(0)
	
func _process(_delta: float) -> void:
	if !state.is_game_over and !state.is_game_started:
		update_score(0)
		pressSpace.show()
	else:
		pressSpace.hide()

# When i click the button, game over is set to false
func _on_StartGameButton_pressed() -> void:
	state.is_game_over = false
	gameOverScreen.hide()
	
func show_game_over_screen(score: int) -> void:
	var prev_high_score = state.read_savegame()
	if score > prev_high_score.highscore:
		state.save(score)
		highScore.text = str(score)
	else:
		var high_score = state.read_savegame()
		highScore.text = str(high_score.highscore)
	yourScore.text = str(score)
	gameOverScreen.show()

func update_score(score: int) -> void:
	scoreLabel.text = 'Score = ' + str(score)
