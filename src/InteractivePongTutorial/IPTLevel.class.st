Class {
	#name : #IPTLevel,
	#superclass : #TestCase,
	#instVars : [
		'game'
	],
	#category : #'InteractivePongTutorial-Levels'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:17'
}
IPTLevel class >> asString [

	^ self subclassResponsibility.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:26'
}
IPTLevel class >> description [
	
	^ self subclassResponsibility.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:16'
}
IPTLevel class >> levelIndex [
	
	^ self subclassResponsibility.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 6/20/2024 11:11'
}
IPTLevel class >> runTests [
	"Runs all tests and returns occuring errors and failures"

	| errors failures |
	
	errors := {} asOrderedCollection.
	failures := {} asOrderedCollection.

	(self allMethodsInCategory: #levelTests) do: [:method |
		[(self selector: method) runCase]
			on: Error do: [:ex | errors add: ex printString ]
			on: TestFailure do: [:ex | failures add: ex printString ]
	].

	^ Dictionary new
		at: #errors put: errors;
		at: #failures put: failures;
		yourself.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:17'
}
IPTLevel class >> visibleCodePieces [
	
	^ self subclassResponsibility.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:24'
}
IPTLevel >> setUp [
	game := IPTGame new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:29'
}
IPTLevel >> tearDown [
	game := nil.
]
