"
This class contains the informations for Level 3 in Chapter 1. It is a Subclass of IPTLevel.
"
Class {
	#name : #IPTLevel0103,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 11:24'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:01'
}
IPTLevel0103 class >> asString [

	^ 'Level 03: Ball movement'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 7/12/2024 19:12'
}
IPTLevel0103 class >> description [
	
	^ 'In this Level, we will introduce the concept of stepping to move the ball.'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/2/2024 10:49'
}
IPTLevel0103 class >> explanations [
	
	^ {
	'All subclasses of Morph are able to overwrite the step method. It will be executed at regular intervals whose lengths in milliseconds are determined by the return value of stepTime'.
	'To alter the movement we introduce the variable speed which stores the x and y movement per step as a point. You will also define the turnHorizontal and turnVertical methods which will later be used to change the direction of the ball when colliding with an obstacle.'.
	'If you are unsure how to proceed or a stuck at a method there are some hints following.'.
	'Hint 1: You can create point with x @ y.'.
	'Hint 2: You can turn by negating the value in x and y respectively using negated'.
	}.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 16:58'
}
IPTLevel0103 class >> levelIndex [

	^ 3
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 15:17'
}
IPTLevel0103 class >> visibleMethods [

	^ {IPTGame>>#initialize.
		IPTGame>>#initializeBall.
		
		IPTBall>>#initialize.
		IPTBall>>#defaultSpeed.
		IPTBall>>#turnHorizontal.
		IPTBall>>#turnVertical.
		IPTBall>>#step.
		IPTBall>>#stepTime }.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'sv 7/12/2024 19:02'
}
IPTLevel0103 >> testBallInitialize [

	self methodToBeTested: (IPTBall >> #initialize).
	
	self assert: (ball isKindOf: IPTBall) description: 'You may not return a value!'.
	self assert: ball color isNil not description: 'Have you initialized the morph?'.
	self assert: (ball color = Color white) description: 'You did not choose the right color!'.
	self assert: (ball extent = ball defaultExtent) description: 'You should set the extent to defaultExtent'.
	self assert: (ball speed isKindOf: Point) description: 'Speed should be set to a Point'.
	self assert: (ball speed = (ball defaultSpeed @ ball defaultSpeed)) description: 'You should set the speed with defaultSpeed values.'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'sv 7/12/2024 19:02'
}
IPTLevel0103 >> testBallStep [

	| expectedPosition |
	self methodToBeTested: (IPTBall >> #step).
	
	expectedPosition := ball position + ball speed.
	ball step.
	self assert: (ball position = expectedPosition) description: 'You did not update the position correctly'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'sv 7/12/2024 19:03'
}
IPTLevel0103 >> testBallStepTime [

	self methodToBeTested: (IPTBall >> #stepTime).
	
	self assert: (ball stepTime isKindOf: Number) description: 'stepTime has to be a Number.'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'sv 7/12/2024 19:03'
}
IPTLevel0103 >> testBallTurnHorizontal [

	| expectedSpeed |
	self methodToBeTested: (IPTBall >> #turnHorizontal).
	
	expectedSpeed := ball speed x negated @ ball speed y.
	ball turnHorizontal.
	self assert: (ball speed = expectedSpeed) description: 'You did not set the speed correctly (turnHorizontal)'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 11:45'
}
IPTLevel0103 >> testBallTurnVertical [

	| expectedSpeed |
	self methodToBeTested: (IPTBall >> #turnVertical).
	
	expectedSpeed := ball speed x @ ball speed y negated.
	ball turnVertical.
	self assert: (ball speed = expectedSpeed) description: 'You did not set the speed correctly'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'sv 7/12/2024 19:03'
}
IPTLevel0103 >> testGameInitialize [

	self methodToBeTested: (IPTGame >> #initialize).
	
	self assert: (ball isKindOf: IPTBall) description: 'You may not return a value!'.
	self assert: ball color isNil not description: 'Have you initialized the morph?'.
	self assert: (ball color = Color white) description: 'You did not choose the right color!'.
	self assert: (ball extent = ball defaultExtent) description: 'You should set the extent to defaultExtent'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'sv 7/12/2024 19:03'
}
IPTLevel0103 >> testGameInitializeBall [

	self methodToBeTested: (IPTGame >> #initializeBall).
	
	game initializeBall.
	
	self assert: (game ball isKindOf: IPTBall) description: 'Ball should be of class Ball'.
	self assert: (game ball center = game center) description: 'You should position the Ball in the center of the game'.
	self assert: (ball speed = (ball defaultSpeed @ ball defaultSpeed)) description: 'You did not set the speed correctly (speed is saved as Point x @ y)'.

]
