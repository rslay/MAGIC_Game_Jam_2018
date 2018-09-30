extends "res://Scenes/Characters/Character.gd"

func movePlayer():
	if Input.is_action_just_pressed('up'):
		changeRail("UP")
	elif Input.is_action_just_pressed('down'):
		changeRail("DOWN")
	
	if Input.is_action_pressed('left'):
		self.move_and_slide(Vector2(-accel, 0), UP)
	elif Input.is_action_pressed('right'):
		self.move_and_slide(Vector2(accel, 0), UP)

func _ready():
	changeState(ANIM.IDLE)
	rail = 2
	pass

func _physics_process(delta):
	movePlayer()
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
