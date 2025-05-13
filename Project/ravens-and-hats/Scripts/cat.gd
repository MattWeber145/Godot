extends CharacterBody2D

var speed = 200
var direction = "right"

@onready var player = $"/root/World/Player"
@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	
	#move
	if direction == "right":
		velocity.x = speed
	elif direction == "left":
		velocity.x = -speed
	move_and_slide()

func _on_body_entered(body: Node2D) -> void:
	if body == player:
		sprite.play("hit")
		player.die()

func _on_hitbox_entered(body: Node2D) -> void:
	if direction == "right":
		direction = "left"
		sprite.flip_h = true
	elif direction == "left":
		direction = "right"
		sprite.flip_h = false
