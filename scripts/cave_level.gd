extends Node2D

@onready var label: Label = $CanvasLayer/Control/Label
@onready var navigation_region_2d: NavigationRegion2D = $NavigationRegion2D
@onready var wall_collapsing_sound: AudioStreamPlayer2D = $WallCollapsingSound
var open_wall_scene = preload("res://scenes/interactables/open_wall_segment.tscn")



var you_win_scene = preload("res://scenes/levels/you_win_screen.tscn")

func update_label():
	label.text = str(gamemanager.plants_eaten)
		#call_deferred("change_scene")


func change_scene():
	get_tree().change_scene_to_file("res://scenes/levels/you_win_screen.tscn")

func spawn_wall_opening():
	wall_collapsing_sound.play()
	var open_wall = open_wall_scene.instantiate()
	add_child(open_wall)
	open_wall.global_position = Vector2(-6, -86)
	NavigationServer2D.map_force_update(get_world_2d().navigation_map)
