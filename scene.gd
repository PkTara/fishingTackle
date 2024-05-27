extends Node2D


var fish = preload("res://fish.tscn")
var dyingFishParticle = preload("res://dying_fish_particle.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	#var x = (33, 224) (1087, 471)
	for i in range(3):
		var b = fish.instantiate()
		$allFish.add_child(b)
		
	
		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = true
		$pauseMenu.show()
		print("yay!")

func _on_fish_spawn_timeout():
	var b = fish.instantiate()
	$allFish.add_child(b)


func _on_player_player_caught_fish(body):
	$Scores.scores[body.frame] += 1
	var particle = dyingFishParticle.instantiate()
	particle.emitting = true
	particle.position = body.position
	$FishDeath.play()
	$allFish.add_child(particle)


func unpauseGame():
	pass # Replace with function body.
