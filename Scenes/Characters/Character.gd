extends KinematicBody2D


const MAX_SPEED = 300
const MAX_X_VELOCITY = 20


# Position, can be "top" "middle" or "bottom"
enum RAILPOS { TOP, MIDDLE, BOTTOM }


# Character animations (switch means switching rails)
enum ANIM { IDLE, ATTACK, SWITCH }



# The horizontal position the player is at in the track
var xpos = 0.5

# Current player mph, their "health"
var speed = 50

# Current player horizontal movement speed within range of scene
var velocity = 0

# Distance player has travelled
var distance = 0

# Player's current state, aka animations
var state = null



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

