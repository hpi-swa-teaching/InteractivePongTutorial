Class {
	#name : #IPTLevel,
	#superclass : #TestCase,
	#instVars : [
		'game',
		'ball',
		'player',
		'methodToBeTested'
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
	#'squeak_changestamp' : 'Felix Knöfel 7/3/2024 11:30'
}
IPTLevel class >> extractTestedMethodFromException: anException [
	|context|
	context := anException signalerContext.
	[context methodClass = self] 
		whileFalse: [context := context sender].
	^ context receiver methodToBeTested.

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
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 21:11'
}
IPTLevel class >> resultEntryToString: aTestResultEntry [
	(aTestResultEntry at: #method) ifNil: [^ (aTestResultEntry at: #string)].
	^ (IPT compiledMethodToString: (aTestResultEntry at: #method)), ' - ', (aTestResultEntry at: #string)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 16:50'
}
IPTLevel class >> runTests [
	"Runs all tests and returns occuring errors and failures"

	| errors failures |
	
	errors := {} asOrderedCollection.
	failures := {} asOrderedCollection.

	(self allMethodsInCategory: #levelTests) do: [:method |
		[(self selector: method) runCase]
			on: Error do: [:ex | errors add: (Dictionary new
				at: #string put: ex printString;
				at: #method put: (self extractTestedMethodFromException: ex);
				yourself)]
			on: TestFailure do: [:ex | failures add:  (Dictionary new
				at: #string put: ex printString;
				at: #method put: (self extractTestedMethodFromException: ex);
				yourself)]].

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
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/3/2024 11:30'
}
IPTLevel >> methodToBeTested [
	^ methodToBeTested
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/3/2024 11:30'
}
IPTLevel >> methodToBeTested: anObject [
	methodToBeTested := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/3/2024 12:40'
}
IPTLevel >> setUp [
	game := IPTGame new.
	ball := IPTBall new.
	player := IPTPlayer new.
	
	ball game: game.
	game ball: ball.
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

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/3/2024 11:32'
}
IPTLevel >> testPlaygroundLaunch [
	self methodToBeTested: 0.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/3/2024 11:32'
}
IPTLevel >> testRunCode [
	self methodToBeTested: (IPTPlayground >> #runCode).
	
]
