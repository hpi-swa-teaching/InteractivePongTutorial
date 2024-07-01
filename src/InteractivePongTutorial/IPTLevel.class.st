Class {
	#name : #IPTLevel,
	#superclass : #TestCase,
	#instVars : [
		'game',
		'ball',
		'player'
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
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 11:39'
}
IPTLevel class >> explanations [

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
	#'squeak_changestamp' : 'sv 6/20/2024 11:28'
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
		at: #success put: ((errors isEmpty) and: [failures isEmpty]);
		yourself.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:59'
}
IPTLevel class >> visibleMethods [
	"Returns a list of IPTMethodSelectors"
	^ self subclassResponsibility.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 15:23'
}
IPTLevel >> setUp [
	game := IPTGame new.
	ball := IPTBall new.
	player := IPTPlayer new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 15:23'
}
IPTLevel >> tearDown [
	game := nil.
	ball := nil.
	player := nil.
]
