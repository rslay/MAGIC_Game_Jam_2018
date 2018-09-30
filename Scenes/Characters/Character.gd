extends KinematicBody2D


const MAX_X_VELOCITY = 20


# Position, can be "top" "middle" or "bottom"
enum RAILPOS { TOP, MIDDLE, BOTTOM }

const TOP_RAIL_POS = 150


# Character animations (switch means switching rails)
enum ANIM { IDLE, ATTACK, SWITCH }

const UP = Vector2(0, -1)


# Acceleration speed
var accel = 200

# The horizontal position the player is at in the track
var xpos = 0.5

# Current player horizontal movement speed within range of scene
var velocity = 0

# Distance player has travelled
var distance = 0

# Player's current state, aka animations
var state = null

# Player's current rail (1=top, 2=mid, 3=bot)
var rail = null


# Changes the character state animation
func changeState(newState):
	
	match newState:
		IDLE:
			$AnimationPlayer.play('idle')
		ATTACK:
			$AnimationPlayer.play('attack')
		SWITCH:
			$AnimationPlayer.play('switch')
	
	state = newState
	pass


# Switch to a specific rail or move to a rail relative to the character
func changeRail(direction):
	
	changeState(SWITCH)
	
	var _directionType = typeof(direction)
	
	if _directionType == 4: # typeof 4 == string
		# If the character is moving up or down
		if direction == "UP":
			rail = max(rail - 1, 1)
		elif direction == "DOWN":
			rail = min(rail + 1, 3)
		else:
			ERR_PARAMETER_RANGE_ERROR('The character can only move up, down, or to a specific rail (RAILPOS.TOP, etc)')
	else:
		# If the character is moving to a specific rail
		if direction == RAILPOS.TOP:
			rail = 1
		elif direction == RAILPOS.MIDDLE:
			rail = 2
		elif direction == RAILPOS.BOTTOM:
			rail = 3
		else:
			ERR_PARAMETER_RANGE_ERROR('The character can only move up, down, or to a specific rail (RAILPOS.TOP, etc)')
			
	self.position.y = TOP_RAIL_POS * rail
	
	pass

