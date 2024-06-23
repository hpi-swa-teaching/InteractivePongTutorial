Class {
	#name : #IPTLevel0101,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 16:47'
}
IPTLevel0101 class >> asString [

	^ 'Level 01: Intro'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:48'
}
IPTLevel0101 class >> description [
	
	^ 'In this level, you will get Introduced to the Tutorial and learn about basic Morph methods.'.
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
	#'squeak_changestamp' : 'sv 6/20/2024 11:22'
}
IPTLevel0101 >> testGameInitialize [
	self assert: (game isKindOf: IPTGame) description: 'You may not return a value!'.
	self assert: game color isNil not description: 'Have you initialized the morph?'.
	self assert: Color green equals: game color description: 'You did not choose the right color!'.
]
