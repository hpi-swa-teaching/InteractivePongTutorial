"
This class contains the informations for Level 4 in Chapter 1. It is a Subclass of IPTLevel.
"
Class {
	#name : #IPTLevel0104,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 11:24'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:01'
}
IPTLevel0104 class >> asString [

	^ 'Level 04: Wall collision'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:44'
}
IPTLevel0104 class >> description [
	
	^ 'In this level, you will learn how to check for simple Collisions by implementing the collision between the ball and the walls.'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 15:33'
}
IPTLevel0104 class >> explanations [
	
	^ {
	'In the last level we had to set the postion of the ball manually to see it. Now we want to reset the e.g. if it hits the wall. Therefore you will need to implement the new method startOver.'.
	'It would be boring if the ball always started moving in the same direction, therefore try to set the direction randomly to one of four diagonal directions (still use defaultSpeed). Also dont forget to place the ball in the center of the game again.'.
	'Until now, the ball moved straight forward only. In this level, we want it to bounce off the top and bottom walls. Upon touching a wall left or right, the ball should start over. Test the collision by comparing the position of the ball with the top, bottom, left and right of the game.'.
	'If you are unsure how to proceed or a stuck at a method there are some hints following.'.
	'Hint 1: You can use {1 . -1} atRandom for a random positive or negative Value'.
	'Hint 2: You get can get the coordinates of the games outer walls with game left / game top / game right / game bottom.'.
	'Hint 3: To check if a value is in between to Numbers you can use between: aNumber and: aNumber.'.
	}.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:46'
}
IPTLevel0104 class >> levelIndex [

	^ 4
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:41'
}
IPTLevel0104 class >> visibleMethods [

	^ {IPTGame>>#initialize.
		IPTGame>>#initializeBall.
		
		IPTBall>>#turnHorizontal.
		IPTBall>>#step.
		IPTBall>>#turnVertical.
		IPTBall>>#initialize.
		IPTBall>>#checkCollisionWithWalls.
		IPTBall>>#startOver}.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 11:36'
}
IPTLevel0104 >> testBallStartOver [
	self methodToBeTested: (IPTBall >> #startOver).
	
	ball startOver.
	self assert: ball center equals: game center description: 'You should position the Ball in the center of the game'.
	self assert: ({#x . #y} allSatisfy: [:component | 
		ball defaultSpeed * {1 .-1} contains: [ :speedComponent | 
			speedComponent = (ball speed perform: component)]])
		description: 'You should set the speed of the ball to a random diagonal vector with component lengths of defaultSpeed'.


]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
}
IPTLevel0104 >> testBallStep [

	| expectedPosition  expectedSpeed |
	self methodToBeTested: (IPTBall >> #step).
	
	expectedPosition := ball position + ball speed.
	expectedSpeed := ball speed negated.
	
	ball step.
	self assert: (ball position = expectedPosition) description: 'You did not update the position correctly'.
	
	ball position: ball game left -1.
	ball speed: -1.
	ball step.
	self assert: (ball center = game center) description: 'You should call startOver when the ball reaches the left wall'.
	
	ball position: (ball game right - ball width + 1).
	ball speed: 1.
	ball step.
	self assert: (ball center = game center) description: 'You should call startOver when the ball reaches the right wall'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 13:48'
}
IPTLevel0104 >> testBallcheckCollisionWithWalls [

	| expectedSpeed |
	
	self methodToBeTested: (IPTBall >> #checkCollisionWithWalls).	
		
	ball position: ball game left -1.
	ball checkCollisionWithWalls.
	self assert: (ball center = game center) description: 'You should call startOver when the ball reaches the left wall'.
	
	ball position: (ball game right - ball width + 1).
	ball checkCollisionWithWalls.
	self assert: (ball center = game center) description: 'You should call startOver when the ball reaches the right wall'.
		
	expectedSpeed := ball speed x @ ball speed y negated.	
	ball position: (ball game center x)@(ball game top - 1).
	ball checkCollisionWithWalls.
	self assert: (ball speed = expectedSpeed) description: 'You should change the speed when the ball reaches the top'.
	.
	expectedSpeed := ball speed x @ ball speed y negated.
	ball position: (ball game bottom - ball height +1).
	ball checkCollisionWithWalls.
	self assert: (ball speed = expectedSpeed) description: 'You should change the speed when the ball reaches the bottom'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 12:15'
}
IPTLevel0104 >> testGameInitializeBall [
	self methodToBeTested: (IPTGame >> #initializeBall).
	
	game initializeBall.
	self assert: (game ball isKindOf: IPTBall) description: 'Ball should be of class Ball'.
	
	self assert: (game ball center = game center) description: 'You should call startOver'.
	


]
