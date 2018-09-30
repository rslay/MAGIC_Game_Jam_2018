extends KinematicBody2D


const MAX_X_VELOCITY = 20


# Position, can be "top" "middle" or "bottom"
enum RAILPOS { TOP, MIDDLE, BOTTOM }

const TOP_RAIL_POS = 150
const EDGEOFFSET = 120

# Character animations (switch means switching rails)
enum ANIM { IDLE, ATTACK, SWITCH }

const UP = Vector2(0, -1)
const DOWN = Vector2(0, 1)


# Vertical distance between rails
var vRailDist = 150

# Vertical acceleration speed
var vAccel = 10

# Horizontal acceleration speed
var xAccel = 300

# The horizontal position the player is at in the track
var xpos = 0.5

# Current player horizontal movement speed within range of scene
var velocity = 0

# Distance player has travelled
var distance = 0

# Player's current state, aka animations
var state = ANIM.IDLE

# Player's current rail (1=top, 2=mid, 3=bot)
var rail = 2

# Rail the player is jumping from
var jumpingFrom = 0

# Changes the character state animation
func changeState(newState):
	
	match newState:
		ANIM.IDLE:
			$AnimatedSprite.play('idle')
		ANIM.ATTACK:
			$AnimatedSprite.play('attack')
		ANIM.SWITCH:
			jumpingFrom = rail * vAccel
			$AnimatedSprite.play('switch')
	
	state = newState
	pass


func changeRail():
	print(rail)
	
#	print("moving down. Y POS:")
#	print(self.position.y)
#	print("Rail POS:")
#	print(rail * vRailDist)

	if self.position.y > rail * vRailDist:
		self.position.y -= vAccel
	elif self.position.y < rail * vRailDist:
		self.position.y += vAccel
	else:
		jumpingFrom = rail * vRailDist
		changeState(ANIM.IDLE)
			

