extends Control
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var player_attack: PackedScene = preload('res://scenes/battlesystem/battle_player_attack.tscn')

func _ready() -> void:
	Dialogic.start('battle-start')
	await Dialogic.timeline_ended
	spawnPlayerAttack()


func spawnPlayerAttack():
	audio_stream_player.stream_paused = true
	var player_attack_scene = player_attack.instantiate()
	add_child(player_attack_scene)
	player_attack_scene.global_position = Vector2(572, 444)
