extends "res://Scenes/Characters/Character.gd"

const attackFrameLength = 60
var attackCounter = 0

func movePlayer():
	if state != ANIM.SWITCH and state != ANIM.ATTACK:
		if Input.is_action_just_pressed('up'):
			changeState(ANIM.SWITCH)
			rail = max(rail-1,1)
		elif Input.is_action_just_pressed('down'):
			changeState(ANIM.SWITCH)
			rail = min(rail+1,3)
		
	if state == ANIM.SWITCH:
		changeRail()
	elif state == ANIM.ATTACK:
		attackCounter += 1
		if attackCounter == attackFrameLength:
			changeState(ANIM.IDLE)
			attackCounter = 0
	else:
		if Input.is_action_just_pressed('ui_accept'):
			changeState(ANIM.ATTACK)
			pass
		
	if Input.is_action_pressed('left'):
		$AnimatedSprite.set_flip_h(true)
		self.move_and_slide(Vector2(-xAccel, 0), UP)
	elif Input.is_action_pressed('right'):
		$AnimatedSprite.set_flip_h(false)
		self.move_and_slide(Vector2(xAccel, 0), UP)
		
	if self.position.x > get_viewport().size.x - EDGEOFFSET:
		self.position.x = get_viewport().size.x - EDGEOFFSET
	elif self.position.x < EDGEOFFSET:
		self.position.x = EDGEOFFSET


func _ready():
	changeState(ANIM.IDLE)
	pass

func _physics_process(delta):
	movePlayer()
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
