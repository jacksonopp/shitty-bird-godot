extends KinematicBody2D

# ABOUT THIS SCENE
# This file is expecting the following inputs to be set up
# move_left, move_right, jump

const FLOOR_NORMAL = Vector2.UP

onready var start_position = global_position

export var jump_force := 1000.0
export var gravity := 3000.0
export var jump_height := 0.0

enum {
	SCORE = 4,
	HIT = 8
}

var stats = GameStats
var velocity := Vector2.ZERO

# Runs physics calc on every frame
func _physics_process(delta: float) -> void:

	jump_state(delta)

func jump_state(delta: float) -> void:	
	var direction := get_direction()
	
	velocity = calculate_move_velocity(velocity, direction, jump_force, delta)
	
	if stats.is_game_started:
		velocity = move_and_slide(velocity, FLOOR_NORMAL)

# Get movement direction
func get_direction() -> Vector2:
	return Vector2(
		0,
		-1.0 if Input.is_action_just_pressed("jump") else 1.0
	)

# Calculates the move velocity
func calculate_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	force: float,
	delta: float
) -> Vector2:
	var out_v := linear_velocity
	out_v.y += gravity * delta
	
	if direction.y == -1:
		out_v.y = force * direction.y
		
	return out_v

func _on_Hurtbox_area_entered(area: Area2D) -> void:
	if area.collision_layer == HIT:
		queue_free()
		stats.is_game_over = true
	else:
		stats.score = stats.score + 1
