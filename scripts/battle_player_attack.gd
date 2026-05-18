extends Node2D

@onready var cursor_bar: CharacterBody2D = $CursorBar


func _on_edge_left_body_entered(body: Node2D) -> void:
	body.reverse_movement()




func _on_edge_right_body_entered(body: Node2D) -> void:
	body.reverse_movement()


func _on_hit_bar_body_entered(_body: Node2D) -> void:
	cursor_bar.isOnGreenTarget = true


func _on_hit_bar_body_exited(_body: Node2D) -> void:
	cursor_bar.isOnGreenTarget = false


func _on_yellow_hit_bar_left_body_entered(_body: Node2D) -> void:
	cursor_bar.isOnYellowTarget = true


func _on_yellow_hit_bar_right_body_entered(_body: Node2D) -> void:
	cursor_bar.isOnYellowTarget = true


func _on_yellow_hit_bar_right_body_exited(_body: Node2D) -> void:
	cursor_bar.isOnYellowTarget = false


func _on_yellow_hit_bar_left_body_exited(_body: Node2D) -> void:
	cursor_bar.isOnYellowTarget = false
