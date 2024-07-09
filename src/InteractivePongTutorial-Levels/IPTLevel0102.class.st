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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/2/2024 10:28'
}
IPTLevel0102 class >> explanations [
	
	^ {'Now you have another class to work on, IPTBall. You should also initialize it, similar to IPTGame.'.
	'If you look at the IPTBall and IPTGame class code, you will notice that they have instance variables for referencing each other. For those instance variables you need to create getters and setters to use the reference in their respective classes. It is best to do this first so you can use it in the implementation of the other methods.'.	
		'Another important aspect of Morhps is submorph behaviour. The ball is supposed to be in the game and have its position set in relation to the game. This can be implemented with calling addMorph: aMorph (here ball) on the parent.'.
	}
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
	#'squeak_changestamp' : 'Felix Knöfel 7/3/2024 11:30'
}
IPTLevel0102 >> test_Ball_game [
	self methodToBeTested: (IPTBall >> #game).
	
	"Use instVarNamed:put: instead of the setter in case the player did not implement the setter."
	ball instVarNamed: 'game' put: game.
	self assert: (ball game = game) description: 'Ball game should return the value it was set on in game:'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/3/2024 11:30'
}
IPTLevel0102 >> test_Ball_game_setter [
	self methodToBeTested: (IPTBall >> #game:).
	
	ball game: game.
	self assert: (ball instVarNamed: 'game') = game description: 'Ball game: should set game on the input'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/3/2024 11:30'
}
IPTLevel0102 >> test_Ball_initialize [
	self methodToBeTested: (IPTBall >> #initialize).
	
	self assert: (ball isKindOf: IPTBall) description: 'You may not return a value!'.
	self assert: ball color isNil not description: 'Have you initialized the morph?'.
	self assert: (ball color = Color white) description: 'You did not choose the right color!'.
	self assert: (ball extent = ball defaultExtent) description: 'You should set the extent to defaultExtent'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/3/2024 11:30'
}
IPTLevel0102 >> test_Game_ball [
	self methodToBeTested: (IPTGame >> #ball).
	
	"Use instVarNamed:put: instead of the setter in case the player did not implement the setter."
	game instVarNamed: 'ball' put: ball.
	self assert: (game ball = ball) description: 'Game ball should return the value it was set on in ball:'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/3/2024 11:30'
}
IPTLevel0102 >> test_Game_ball_setter [
	self methodToBeTested: (IPTGame >> #ball:).
	
	game ball: ball.
	self assert: (game instVarNamed: 'ball') = ball description: 'Game ball: should set ball on the input'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/3/2024 11:30'
}
IPTLevel0102 >> test_Game_initialize [
	self methodToBeTested: (IPTGame >> #initialize).
	
	self assert: (game isKindOf: IPTGame) description: 'You may not return a value!'.
	self assert: game color isNil not description: 'Have you initialized the morph?'.
	self assert: (game color = Color black) description: 'You did not choose the right color!'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/3/2024 12:25'
}
IPTLevel0102 >> test_Game_initializeBall [
	self methodToBeTested: (IPTGame >> #initializeBall).
	
	game initializeBall.
	self assert: (game ball isKindOf: IPTBall) description: 'Ball should be of class Ball'.
	self assert: (game ball center = game center) description: 'You should position the Ball in the center of the game'.
]