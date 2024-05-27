extends TextureRect  
class_name TextureRectAnimated  

@export var spriteHeight: int  
@export var spriteWidth: int  

@export var loop: bool = false     

@export var animating: bool = true  

var currentSprite: int = 0    


func _process(delta: float):      
	#Stop here if the animation is not supposed to be running.
	if not animating:   
		return  
	  
	#Set the new region of the sprite sheet to show
	texture.region = Rect2(spriteWidth * currentSprite, 0, spriteWidth, spriteHeight)  

	#Advance the counter
	currentSprite += 1
	  
	#Return to 0 if it already reached the end of the sheet
	var totalSprites: int = texture.get_width() / spriteWidth  
	if currentSprite > totalSprites:  
		currentSprite = 0        
		
		#If not looping, stop here.
		if not loop:  
			animating = false

func start_animation():  
	currentSprite = 0
	animating = true
