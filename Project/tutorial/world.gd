extends Node2D

@export var a = "Hello"
@export var b = "world"
@export var toggle = false

var timer = 0
var c

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if timer < 1:
		timer += 1 * delta
	if timer >= 1:
		toggle = !toggle
		timer = 0
	
	if toggle and c != a:
		c = a
		print(c)
	
	if !toggle and c != b:
		c = b
		print(c)
	
