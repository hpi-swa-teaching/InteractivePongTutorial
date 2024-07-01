Class {
	#name : #IPTLevel0103,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels'
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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:46'
}
IPTLevel0103 class >> description [
	
	^ 'In this level, you will learn how to move a Morph by implementing the movement of the Ball class.'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 12:35'
}
IPTLevel0103 class >> explanations [
	
	^ {''}.
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
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 15:53'
}
IPTLevel0103 class >> visibleMethods [

	^ {IPTMethodSelector make: IPTGame >> #initialize readOnly: true. 
		IPTMethodSelector make: IPTGame >> #initializeBall readOnly: true.
		
		IPTMethodSelector make: IPTBall >> #turnHorizontal readOnly: false.
		IPTMethodSelector make: IPTBall >> #stepTime readOnly: true. 
		IPTMethodSelector make: IPTBall >> #step readOnly: false. 
		IPTMethodSelector make: IPTBall >> #turnVertical readOnly: false.
		IPTMethodSelector make: IPTBall >> #initialize readOnly: false.}.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 16:17'
}
IPTLevel0103 >> test_Ball_initialize [
	self assert: (ball isKindOf: IPTBall) description: 'You may not return a value!'.
	self assert: ball color isNil not description: 'Have you initialized the morph?'.
	self assert: (ball color = Color white) description: 'You did not choose the right color!'.
	self assert: (ball extent = ball defaultExtent) description: 'You should set the extent to defaultExtent'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 16:18'
}
IPTLevel0103 >> test_Ball_step [
	|expectedPosition|
	expectedPosition := ball position + ball speed.
	ball step.
	self assert: (ball position = expectedPosition) description: 'You did not update the position correctly'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 16:18'
}
IPTLevel0103 >> test_Ball_stepTime [
	self assert: (ball stepTime isKindOf: Number) description: 'stepTime has to be a Number.'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 16:18'
}
IPTLevel0103 >> test_Ball_turnHorizontal [
	| expectedSpeed |
	expectedSpeed := ball speed x negated @ ball speed y.
	ball turnHorizontal.
	self assert: (ball speed = expectedSpeed) description: 'You did not set the speed correctly (turnHorizontal)'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 16:18'
}
IPTLevel0103 >> test_Ball_turnVertical [
	| expectedSpeed |
	expectedSpeed := ball speed x @ ball speed y negated.
	ball turnVertical.
	self assert: (ball speed = expectedSpeed) description: 'You did not set the speed correctly (turnVertical)'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 16:18'
}
IPTLevel0103 >> test_Game_initialize [
	self assert: (ball isKindOf: IPTBall) description: 'You may not return a value!'.
	self assert: ball color isNil not description: 'Have you initialized the morph?'.
	self assert: (ball color = Color white) description: 'You did not choose the right color!'.
	self assert: (ball extent = ball defaultExtent) description: 'You should set the extent to defaultExtent'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 16:19'
}
IPTLevel0103 >> test_Game_initializeBall [
	game initializeBall.
	self assert: (game ball isKindOf: IPTBall) description: 'Ball should be of class Ball'.
	self assert: (game ball position = game center) description: 'You should set the position of the Ball to the center of the game'.
	self assert: (ball speed = (ball defaultSpeed @ ball defaultSpeed)) description: 'You did not set the speed correctly (speed is saved as Point x @ y)'.

]
