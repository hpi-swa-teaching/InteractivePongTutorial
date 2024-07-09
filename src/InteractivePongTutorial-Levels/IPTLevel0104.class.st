Class {
	#name : #IPTLevel0104,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels'
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
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 14:39'
}
IPTLevel0104 class >> visibleMethods [

	^ {{IPTGame. #initialize }. 
		{IPTGame. #initializeBall }.
		
		{IPTBall. #turnHorizontal }. 
		{IPTBall. #step }. 
		{IPTBall. #turnVertical }. 
		{IPTBall. #initialize }.
		{IPTBall. #checkCollisionWithWalls }. 
		{IPTBall. #startOver }}.
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
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 11:37'
}
IPTLevel0104 >> testGameInitialize [
	self methodToBeTested: (IPTGame >> #initialize).
	
	self assert: (ball isKindOf: IPTBall) description: 'You may not return a value!'.
	self assert: ball color isNil not description: 'Have you initialized the morph?'.
	self assert: (ball color = Color white) description: 'You did not choose the right color!'.
	self assert: (ball extent = ball defaultExtent) description: 'You should set the extent to defaultExtent'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 11:37'
}
IPTLevel0104 >> testGameInitializeBall [
	self methodToBeTested: (IPTGame >> #initializeBall).
	
	game initializeBall.
	self assert: (game ball isKindOf: IPTBall) description: 'Ball should be of class Ball'.
	self assert: (game ball center = game center) description: 'You should position the Ball in the center of the game'.
	self assert: (ball speed = (ball defaultSpeed @ ball defaultSpeed)) description: 'You did not set the speed correctly (speed is saved as Point x @ y)'.


]
