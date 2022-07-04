extends Node2D

onready var Sprite = get_node(".")
var Position = Vector2(0,0)
export var scroll_speed : float = 1
var bg_position : float = 0.0
var scale_ : float 
var coords : Vector2
var limit : float

func _ready():
	var screen_size = get_viewport().size
	var image = Sprite.get_node("Background")
	var coords = image.texture.get_size()
	scale_ = screen_size.x / coords.x
	scale = Vector2(scale_, scale_)
	position = Vector2(
		screen_size.x / 2,
		- (coords.y * scale_ / 2 - screen_size.y)
	)
	limit = coords.y * scale_ - screen_size.y

func _process(delta):

	# Create the scrolling updation with a static var
	var prev_position : Vector2 = position
	if (bg_position < limit):
		bg_position += scroll_speed
		position = Vector2(prev_position.x, prev_position.y + scroll_speed)
	else :
		print(position)
		print(limit)
		
