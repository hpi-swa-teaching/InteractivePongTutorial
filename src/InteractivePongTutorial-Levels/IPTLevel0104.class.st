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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/2/2024 11:31'
}
IPTLevel0104 class >> explanations [
	
	^ {
	'In the last level we needed to set the postion of the ball manually to be able to see it. Now we want to be able to reset the ball for example if it hits the wall, therefore you will need to implement the new method startOver.'.
	'It would be boring if the ball would always start with the same direction, therefore try to set the direction randomly but still use defaultSpeed. Also dont forget to put the ball in the center of the game.'.
	'Until now the ball just moves in one direction, we want it to bounce off the top and bottom walls. The walls on the left and right side should reset the ball on collision. Test the collision by comparing the position of the ball with the top, bottom, left and right of the game.'.
	'If you are unsure how to proceed or a stuck at a method there are some hints following.'.
	'Hint 1: You can use {1 . -1} atRandom for a random positive or negative Value'.
	'Hint 2: To check if a value is in between to Numbers you can use between: aNumber and: aNumber.'.
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
