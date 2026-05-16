extends StaticBody2D




func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("interact"):
		gamemanager.isInDialogue = true
		Dialogic.start('veldora-start')


func _on_mouse_entered() -> void:
	gamemanager.isOnCharacter = true


func _on_mouse_exited() -> void:
	gamemanager.isOnCharacter = false
