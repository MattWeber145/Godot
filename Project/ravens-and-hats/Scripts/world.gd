extends Node2D

@export var shinies = 0

@onready var player = $"."
@onready var shinies_label = $CanvasLayer/UI/Shinies
@onready var camera = $Player/Camera2D2
@onready var level_title = $CanvasLayer/UI/LevelTitle

func _ready() -> void:
	pass

func add_shiny():
	shinies += 1

func _process(delta: float) -> void:
	
	#update shinies
	shinies_label.text = "Shinies: %s" % shinies

func _physics_process(delta: float) -> void:
	pass


func _on_level_two_entered(body: Node2D) -> void:
	if shinies == 10:
		print("Level up!")
		body.position = Vector2(3900, 80)
		camera.limit_bottom = 810
		level_title.text = "Level 2: The Market - Don't get caught!"
	else:
		print("Not enough shinies")


func _on_level_3_entered(body: Node2D) -> void:
		if shinies == 20:
			print("Level up!")
			if body.is_in_group("Player"):
				body.position = Vector2(9520, 600)
				level_title.text = "Level 3: The Slums"


func _on_game_end_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Scenes/end.tscn")
