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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:20'
}
IPTLevel0103 class >> visibleCodePieces [

	^ {IPTGame >> #initialize. IPTGame >> #initializeBall.
		IPTBall >> #turnHorizontal. IPTBall >> #speed. IPTBall >> #speed:. IPTBall >> #stepTime. 		IPTBall >> #step. IPTBall >> #turnVertical. IPTBall >> #initialize.}.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:31'
}
IPTLevel0103 >> testGameInitialize [

	self assert: game color equals: Color green description: 'You did not choose the right color!'.
]
