extends Node2D

var shinies = 0

@onready var player = $Player
@onready var shinies_label = $CanvasLayer/UI/Shinies

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#update shinies
	shinies_label.text = "Shinies: %s" % shinies
	
func add_shiny():
	shinies += 1
