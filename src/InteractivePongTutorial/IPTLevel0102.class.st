Class {
	#name : #IPTLevel0102,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:35'
}
IPTLevel0102 class >> asString [

	^ 'Level ', self levelIndex asString.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:35'
}
IPTLevel0102 class >> description [
	
	^ 'This is level 02'.
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
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:15'
}
IPTLevel0102 class >> visibleCodePieces [

	^ {IPTGame >> #initialize }.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:31'
}
IPTLevel0102 >> testGameInitialize [

	self assert: game color equals: Color green description: 'You did not choose the right color!'.
]
