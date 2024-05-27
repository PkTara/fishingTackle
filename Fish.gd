extends CharacterBody2D
@export var frame: int = 0 
func _ready():
	randomize()
	position = Vector2i(randi() % 1000 + 33, randi() % 400 + 300)
	frame = randi() % 3
	$Sprite2D.frame = frame


var direction = [1 ,-1][randi() % 2]
var speed_multiplier = randi() % 3 + 1
var time = 0

func _physics_process(delta):
	velocity.x = direction * 50 * speed_multiplier
	velocity.y = sin(time) * 30 * speed_multiplier
	time += 0.1
	
	$Sprite2D.flip_h = false if direction >0 else true
	

	var collidedBody =  move_and_collide(velocity * delta)
	if collidedBody:
		direction *= -1
	


func _on_area_2d_body_entered(body):
	direction * -1
