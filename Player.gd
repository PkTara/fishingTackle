extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
signal playerCaughtFish(body)
var hookDown = false
var hookIcon = "fishTackle.png"
var fishHookFrame = 3

var fishHook = preload("res://fishing_rod_line.tscn")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func hookShoot(icon):
	var b = fishHook.instantiate()
	owner.add_child(b)
	b.transform = $Sprite2D/hookMark.global_transform
	b.frame = fishHookFrame
	b.fishCaught.connect(callFishSignal)
	
func callFishSignal(body):
	playerCaughtFish.emit(body)
	



func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		$Sprite2D.flip_h = false if direction > 0 else true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if not hookDown and Input.is_action_pressed("space"):
		hookShoot(hookIcon)
		hookDown = true
		$Timer.start()
		
	move_and_slide()


func _on_timer_timeout():
	hookDown = false


func _on_potion_equip_pressed(frame):
	fishHookFrame = frame


func _on_potion_equip_2_pressed():
	pass # Replace with function body.
