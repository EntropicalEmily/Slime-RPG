extends CharacterBody2D

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

var speed: int = 300

var target_position: Vector2
var clicked_position: Vector2


#click to move logic without pathfinding
#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("interact"):
		#clicked_position = get_global_mouse_position()
#
#func _physics_process(_delta: float) -> void:
	#if position.distance_to(clicked_position) > 4:
		#target_position = (clicked_position - position).normalized()
		#velocity = target_position * speed
		#move_and_slide()


func _ready() -> void:
	navigation_agent_2d.target_position = global_position

func _input(event: InputEvent) -> void:

	if event.is_action_pressed("interact"):
		if gamemanager.isOnCharacter or gamemanager.isInDialogue or gamemanager.isInBattle:
			return
		else:
			navigation_agent_2d.target_position = get_global_mouse_position()
			var map = get_world_2d().navigation_map
			navigation_agent_2d.target_position = NavigationServer2D.map_get_closest_point(map, navigation_agent_2d.target_position)


func _physics_process(_delta: float) -> void:
	if !position.distance_to(navigation_agent_2d.target_position) < 3:
		var nav_point_direction = navigation_agent_2d.target_position
		velocity = (nav_point_direction - global_position).normalized() * speed
		move_and_slide()
