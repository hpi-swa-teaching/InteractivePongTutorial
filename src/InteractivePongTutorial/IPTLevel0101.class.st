Class {
	#name : #IPTLevel0101,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:15'
}
IPTLevel0101 class >> asString [

	^ 'Level 01'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:26'
}
IPTLevel0101 class >> description [
	
	^ 'This is level 01'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:15'
}
IPTLevel0101 class >> levelIndex [

	^ 1
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:15'
}
IPTLevel0101 class >> visibleCodePieces [

	^ {IPTGame >> #initialize }.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:31'
}
IPTLevel0101 >> testGameInitialize [

	self assert: game color equals: Color green description: 'You did not choose the right color!'.
]
