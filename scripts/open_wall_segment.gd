extends Sprite2D
@onready var navigation_region_2d: NavigationRegion2D = $NavigationRegion2D


func _ready() -> void:
	navigation_region_2d.bake_navigation_polygon()

func _on_area_2d_body_entered(_body: Node2D) -> void:
	var root = get_tree().root.get_children()
	for roots in root:
		if roots.name == "cave-level":
			call_deferred("win")

func win():
	get_tree().change_scene_to_file("res://scenes/levels/you_win_screen.tscn")
