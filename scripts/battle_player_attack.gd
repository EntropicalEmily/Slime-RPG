extends Node2D

@onready var cursor_bar: CharacterBody2D = $CursorBar


func _on_edge_left_body_entered(body: Node2D) -> void:
	body.reverse_movement()




func _on_edge_right_body_entered(body: Node2D) -> void:
	body.reverse_movement()


func _on_hit_bar_body_entered(_body: Node2D) -> void:
	print("meow")
	cursor_bar.isOnTarget = true


func _on_hit_bar_body_exited(_body: Node2D) -> void:
	cursor_bar.isOnTarget = false
