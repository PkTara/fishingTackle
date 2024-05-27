extends Panel

var canUnpause = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("space"):
		hide()
		$Timer.start()
		get_tree().paused = false

	


func _on_button_pressed():
	hide()
	get_tree().paused = false


func _on_timer_timeout():
	canUnpause = true
