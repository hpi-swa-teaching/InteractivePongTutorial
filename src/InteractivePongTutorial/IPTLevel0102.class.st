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
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 12:35'
}
IPTLevel0102 class >> explanations [
	
	^ {''}
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
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 15:52'
}
IPTLevel0102 class >> visibleMethods [

	^ {IPTMethodSelector make: IPTGame >> #initialize readOnly: true. 
		IPTMethodSelector make: IPTGame >> #initializeBall readOnly: false. 
		IPTMethodSelector make: IPTGame >> #ball readOnly: false. 
		IPTMethodSelector make: IPTGame >> #ball: readOnly: false.
		
		IPTMethodSelector make: IPTBall >> #initialize readOnly: false. 
		IPTMethodSelector make: IPTBall >> #game readOnly: false. 
		IPTMethodSelector make: IPTBall >> #game: readOnly: false.}.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 20:45'
}
IPTLevel0102 >> test_Ball_game [
	self testedMethod: (IPTBall >> #game).
	
	ball game: game.
	self assert: (ball game = game) description: 'Ball game should return the value it was set on in game:'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 20:45'
}
IPTLevel0102 >> test_Ball_game_setter [
	self testedMethod: (IPTBall >> #game:).
	
	ball game: game.
	self assert: (ball instVarNamed: 'game') = game description: 'Ball game: should set game on the input'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 20:45'
}
IPTLevel0102 >> test_Ball_initialize [
	self testedMethod: (IPTBall >> #initialize).
	
	self assert: (ball isKindOf: IPTBall) description: 'You may not return a value!'.
	self assert: ball color isNil not description: 'Have you initialized the morph?'.
	self assert: (ball color = Color white) description: 'You did not choose the right color!'.
	self assert: (ball extent = ball defaultExtent) description: 'You should set the extent to defaultExtent'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 20:46'
}
IPTLevel0102 >> test_Game_ball [
	self testedMethod: (IPTGame >> #ball).
	game ball: ball.
	self assert: (game ball = ball) description: 'Game ball should return the value it was set on in ball:'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 20:46'
}
IPTLevel0102 >> test_Game_ball_setter [
	self testedMethod: (IPTGame >> #ball:).
	
	game ball: ball.
	self assert: (game instVarNamed: 'ball') = ball description: 'Game ball: should set ball on the input'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 20:46'
}
IPTLevel0102 >> test_Game_initialize [
	self testedMethod: (IPTGame >> #initialize).
	
	self assert: (game isKindOf: IPTGame) description: 'You may not return a value!'.
	self assert: game color isNil not description: 'Have you initialized the morph?'.
	self assert: (game color = Color black) description: 'You did not choose the right color!'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 20:46'
}
IPTLevel0102 >> test_Game_initializeBall [
	self testedMethod: (IPTGame >> #initializeBall).
	
	game initializeBall.
	self assert: (game ball isKindOf: IPTBall) description: 'Ball should be of class Ball'.
	self assert: (game ball position = game center) description: 'You should set the position of the Ball to the center of the game'.
]
