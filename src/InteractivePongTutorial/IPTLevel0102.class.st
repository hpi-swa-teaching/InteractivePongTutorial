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
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:31'
}
IPTLevel0102 >> testGameInitialize [

	self assert: game color equals: Color green description: 'You did not choose the right color!'.
]
