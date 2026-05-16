extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var initial_speed: int = 80
var speed: int
var direction: Vector2

var isOnTarget: bool = false

func _init() -> void:
	speed = initial_speed
	direction = Vector2.LEFT

func _physics_process(_delta: float) -> void:
	move_bar()
	if Input.is_action_just_pressed("interact"):
		stop()
		#await get_tree().create_timer(1).timeout
		if isOnTarget:
			sprite_2d.material.set_shader_parameter("intensity", 1.0)
			audio_stream_player_2d.play()
			print("You win!")
			await get_tree().create_timer(1).timeout
			start_again()
		else:
			print("You lose!")
			await get_tree().create_timer(1).timeout
			start_again()


func move_bar():
	velocity = direction * speed
	move_and_slide()

func reverse_movement():
	direction = direction * -1

func stop():
	speed = 0

func start_again():
	speed = initial_speed
	sprite_2d.material.set_shader_parameter("intensity", 0.0)
