extends CharacterBody2D

var direction = "right"
var pos
var moving = false
var level = 1

@export var speed = 190
@export var jump_speed = -300
@export var gravity = 450

@onready var sprite = $AnimatedSprite2D
@onready var hitbox = $CollisionPolygon2D
@onready var world = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	
	# Add gravity every frame
	velocity.y += gravity * delta

	# Input affects x axis only
	velocity.x = Input.get_axis("left", "right") * speed

	move_and_slide()

	# Only allow jumping when on the ground
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = jump_speed
	
	update_direction()
	
	update_anim()
	
	update_pos()
	
	move_and_slide()
	
	get_cheats()


func update_pos() -> void:
	pass

func update_direction():
	var direction
	
	#up
	if Input.is_action_just_pressed("up"):
		moving = true
	
	#left
	if Input.is_action_just_pressed("left"):
		sprite.flip_h = true
		
		moving = true
	
	#up
	if Input.is_action_just_pressed("right"):
		sprite.flip_h = false
		moving = true
	
	#no input
	if !Input.is_anything_pressed() and is_on_floor():
		sprite.play("idle")
		moving = false


func update_anim():
	if moving:
		if is_on_floor():
			sprite.play("walk")
		else:
			sprite.play("fly")

func get_cheats():
	if Input.is_action_just_pressed("level1"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("level2"):
		world.shinies = 10
		position = Vector2(3900, 80)
	if Input.is_action_just_pressed("level3"):
		world.shinies = 20
		position = Vector2(8170, 670)


func die():
	get_tree().reload_current_scene()
	print("death")
