extends ParallaxBackground

export var scroll_speed = 1000

var state = GameStats

func _process(delta: float) -> void:
	if state.is_game_started:
		scroll_offset.x += scroll_speed * delta
