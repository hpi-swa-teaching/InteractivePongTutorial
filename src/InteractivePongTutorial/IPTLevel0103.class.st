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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/2/2024 10:30'
}
IPTLevel0103 class >> description [
	
	^ 'In this level, we will introduce the concept of stepping to move the ball.'.
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
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 20:49'
}
IPTLevel0103 >> test_Ball_initialize [
	self testedMethod: (IPTBall >> #initialize).
	
	self assert: (ball isKindOf: IPTBall) description: 'You may not return a value!'.
	self assert: ball color isNil not description: 'Have you initialized the morph?'.
	self assert: (ball color = Color white) description: 'You did not choose the right color!'.
	self assert: (ball extent = ball defaultExtent) description: 'You should set the extent to defaultExtent'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 20:50'
}
IPTLevel0103 >> test_Ball_step [
	|expectedPosition|
	self testedMethod: (IPTBall >> #step).
	
	expectedPosition := ball position + ball speed.
	ball step.
	self assert: (ball position = expectedPosition) description: 'You did not update the position correctly'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 20:50'
}
IPTLevel0103 >> test_Ball_stepTime [
	self testedMethod: (IPTBall >> #stepTime).
	
	self assert: (ball stepTime isKindOf: Number) description: 'stepTime has to be a Number.'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 20:50'
}
IPTLevel0103 >> test_Ball_turnHorizontal [
	| expectedSpeed |
	self testedMethod: (IPTBall >> #turnHorizontal).
	
	expectedSpeed := ball speed x negated @ ball speed y.
	ball turnHorizontal.
	self assert: (ball speed = expectedSpeed) description: 'You did not set the speed correctly (turnHorizontal)'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 20:51'
}
IPTLevel0103 >> test_Ball_turnVertical [
	| expectedSpeed |
	self testedMethod: (IPTBall >> #turnVertical).
	
	expectedSpeed := ball speed x @ ball speed y negated.
	ball turnVertical.
	self assert: (ball speed = expectedSpeed) description: 'You did not set the speed correctly (turnVertical)'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 20:50'
}
IPTLevel0103 >> test_Game_initialize [
	self testedMethod: (IPTGame >> #initialize).
	
	self assert: (ball isKindOf: IPTBall) description: 'You may not return a value!'.
	self assert: ball color isNil not description: 'Have you initialized the morph?'.
	self assert: (ball color = Color white) description: 'You did not choose the right color!'.
	self assert: (ball extent = ball defaultExtent) description: 'You should set the extent to defaultExtent'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'sv 7/3/2024 10:32'
}
IPTLevel0103 >> test_Game_initializeBall [
	self testedMethod: (IPTGame >> #initializeBall).
	
	game initializeBall.
	self assert: (game ball isKindOf: IPTBall) description: 'Ball should be of class Ball'.
	self assert: (game ball center = game center) description: 'You should set the position of the Ball to the center of the game'.
	self assert: (ball speed = (ball defaultSpeed @ ball defaultSpeed)) description: 'You did not set the speed correctly (speed is saved as Point x @ y)'.

]
