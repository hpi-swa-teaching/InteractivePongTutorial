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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 16:58'
}
IPTLevel0103 class >> levelIndex [

	^ 3
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 17:48'
}
IPTLevel0103 class >> visibleCodePieces [

	^ {IPTGame >> #initialize. IPTGame >> #initializeBall.
		IPTBall >> #turnHorizontal. IPTBall >> #stepTime. IPTBall >> #step. IPTBall >> #turnVertical. IPTBall >> #initialize.}.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 17:39'
}
IPTLevel0103 >> testBallgame_getter [
	ball game: game.
	self assert: (ball game = game) description: 'Ball game should return the value it was set on in game:'
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 17:39'
}
IPTLevel0103 >> testBallgame_setter [
	ball game: game.
	self assert: (ball instVarNamed: 'game') = game description: 'Ball game: should set game on the input'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 17:43'
}
IPTLevel0103 >> testBallturnHorizontal [
	| expectedSpeed |
	expectedSpeed := ball speed x negated @ ball speed y.
	ball turnVertical.
	self assert: (ball speed = expectedSpeed) description: 'You did not set the speed correctly (turnHorizontal)'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 17:43'
}
IPTLevel0103 >> testBallturnVertical [
	| expectedSpeed |
	expectedSpeed := ball speed x @ ball speed y negated.
	ball turnVertical.
	self assert: (ball speed = expectedSpeed) description: 'You did not set the speed correctly (turnVertical)'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 17:40'
}
IPTLevel0103 >> testGameInitialize [
	self assert: (ball isKindOf: IPTBall) description: 'You may not return a value!'.
	self assert: ball color isNil not description: 'Have you initialized the morph?'.
	self assert: (ball color = Color white) description: 'You did not choose the right color!'.
	self assert: (ball extent = ball defaultExtent) description: 'You should set the extent to defaultExtent'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 17:42'
}
IPTLevel0103 >> testGameInitializeBall [
	game initializeBall.
	self assert: (game ball isKindOf: IPTBall) description: 'Ball should be of class Ball'.
	self assert: (game ball position = game center) description: 'You should set the position of the Ball to the center of the game'.
	self assert: (ball speed = (ball defaultSpeed @ ball defaultSpeed)) description: 'You did not set the speed correctly (speed is saved as Point x @ y)'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 17:42'
}
IPTLevel0103 >> testGameball_getter [
	game ball: ball.
	self assert: (game ball = ball) description: 'Game ball should return the value it was set on in ball:'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 17:42'
}
IPTLevel0103 >> testGameball_setter [
	game ball: ball.
	self assert: (game instVarNamed: 'ball') = ball description: 'Game ball: should set ball on the input'.
]
