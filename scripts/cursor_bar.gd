extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var green_hit_bar: Area2D = $"../GreenHitBar"

var initial_speed: float = 1.3
var speed: float
var direction: Vector2
var isMoving: bool = true


var isOnGreenTarget: bool = false
var isOnYellowTarget: bool = false

func _init() -> void:
	speed = initial_speed
	direction = Vector2.LEFT

func _ready() -> void:
	green_hit_bar.position.x = randi_range(-52, 52)

func _physics_process(_delta: float) -> void:
	if isMoving:
		move_bar()
	if Input.is_action_just_pressed("interact") and isMoving:
		stop()
		await get_tree().create_timer(0.05).timeout
		if isOnGreenTarget:
			sprite_2d.material.set_shader_parameter("intensity", 1.0)
			audio_stream_player_2d.play()
			print("You win!")
			await get_tree().create_timer(1).timeout
			start_again()
		elif isOnYellowTarget:
			sprite_2d.material.set_shader_parameter("intensity", 1.0)
			audio_stream_player_2d.play()
			print("You kinda win!")
			await get_tree().create_timer(1).timeout
			start_again()
		else:
			print("You lose!")
			await get_tree().create_timer(1).timeout
			start_again()


func move_bar():
	var custom_velocity = direction * speed
	move_and_collide(custom_velocity)

func reverse_movement():
	direction = direction * -1

func stop():
	isMoving = false
	speed = 0

func start_again():
	isMoving = true
	speed = initial_speed
	sprite_2d.material.set_shader_parameter("intensity", 0.0)
