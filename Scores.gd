extends CanvasLayer

@export var scores: Array = [0, 0, 0]



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var i = 0
	var scoreLabelList = [
	$GridContainer/redFishScore,
	$GridContainer/greenFishScore,
	$GridContainer/blueFishScore
]
	for score in scores:
		scoreLabelList[i].text = str(score)
		i += 1
