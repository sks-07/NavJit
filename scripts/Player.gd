extends Node2D


export var speed = 200
var screen_size
export var initial_xpos_ratio = 0.5
export var initial_ypos_ratio = 0.7
onready var Sprite = get_node("Sprite")

func _ready():
	screen_size = get_viewport().size
	position = Vector2(
		initial_xpos_ratio * screen_size.x, 
		initial_ypos_ratio * screen_size.y
		)
	# Sprite.position = position

func _process(delta):
	var velocity : Vector2 = Vector2.ZERO
	  
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	velocity = velocity.normalized() * speed
	
	# Position handling here
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

