extends Area2D

signal fishCaught(body)
var speed = 250
@export var frame: int = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.y * speed * delta
	$Sprite2D.frame = frame

func _on_body_entered(body):
	if body.is_in_group("fish"):
		fishCaught.emit(body)
		body.queue_free()
	
	queue_free()
