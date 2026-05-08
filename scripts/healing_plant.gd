extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	var root_node = get_tree().current_scene
	if root_node.has_node("NomNomSound"):
		var sound_node = root_node.get_node("NomNomSound")
		sound_node.play()
		gamemanager.plants_eaten += 1
		if root_node.has_method("update_label"):
			root_node.update_label()
			#root_node.spawn_wall_opening()
		if gamemanager.plants_eaten == 6:
			root_node.call_deferred("spawn_wall_opening")
		queue_free()
