Class {
	#name : #IPTLevel0102,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 16:55'
}
IPTLevel0102 class >> asString [

	^ 'Level 02: Create Ball'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:46'
}
IPTLevel0102 class >> description [
	
	^ 'In this level, you will be adding more functionality to the Game class and start implementing the new class, Ball. You will also learn how to link them.'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:35'
}
IPTLevel0102 class >> levelIndex [

	^ 2
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/20/2024 16:58'
}
IPTLevel0102 class >> visibleCodePieces [

	^ {IPTGame >> #initialize. IPTGame >> #initializeBall. IPTGame >> #ball. IPTGame >> #ball:.
		IPTBall >> #initialize. IPTBall >> #game. IPTBall >> #game:.}.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 15:29'
}
IPTLevel0102 >> testBallgame_getter [
	ball game: game.
	self assert: (ball game = game) description: 'Ball game should return the value it was set on in game:'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 15:28'
}
IPTLevel0102 >> testBallgame_setter [
	ball game: game.
	self assert: (ball instVarNamed: 'game') = game description: 'Ball game: should set game on the input'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 15:45'
}
IPTLevel0102 >> testGameInitialize [
	self assert: (ball isKindOf: IPTBall) description: 'You may not return a value!'.
	self assert: ball color isNil not description: 'Have you initialized the morph?'.
	self assert: (ball color = Color white) description: 'You did not choose the right color!'.
	self assert: (ball extent = ball defaultExtent) description: 'You should set the extent to defaultExtent'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 15:24'
}
IPTLevel0102 >> testGameInitializeBall [
	game initializeBall.
	self assert: (game ball isKindOf: IPTBall) description: 'Ball should be of class Ball'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 15:25'
}
IPTLevel0102 >> testGameball_getter [
	game ball: ball.
	self assert: (game ball = ball) description: 'Game ball should return the value it was set on in ball:'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 15:26'
}
IPTLevel0102 >> testGameball_setter [
	game ball: ball.
	self assert: (game instVarNamed: 'ball') = ball description: 'Game ball: should set ball on the input'.
]
