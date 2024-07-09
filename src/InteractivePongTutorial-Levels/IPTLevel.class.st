Class {
	#name : #IPTLevel,
	#superclass : #TestCase,
	#instVars : [
		'game',
		'ball',
		'player',
		'methodToBeTested',
		'isPlayable'
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
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:33'
}
IPTLevel class >> resultEntryToString: aTestResultEntry [
	
	| testedMethod |
	testedMethod := aTestResultEntry at: #method.
	testedMethod ifNil: [^ (aTestResultEntry at: #string)].
	^ testedMethod methodClass asString, '>>', testedMethod selector asSymbol,  ' - ', (aTestResultEntry at: #string)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/8/2024 15:36'
}
IPTLevel class >> runTests [
	"Runs all tests and returns occuring errors and failures"

	| errors failures instance |
	
	errors := {} asOrderedCollection.
	failures := {} asOrderedCollection.
	instance := self new.

	(self allMethodsInCategory: #levelTests) do: [:method |
		[instance setTestSelector: method; runCase]
			on: Error do: [:ex | errors add: (Dictionary new
				at: #string put: ex printString;
				at: #method put: instance methodToBeTested;
				yourself)]
			on: TestFailure do: [:ex | failures add:  (Dictionary new
				at: #string put: ex printString;
				at: #method put: instance methodToBeTested;
				yourself)]].

	^ Dictionary new
		at: #errors put: errors;
		at: #failures put: failures;
		at: #success put: ((errors isEmpty) and: [failures isEmpty]);
		at: #isPlayable put: instance isPlayable;
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
	#'squeak_changestamp' : 'Felix Knöfel 7/8/2024 15:31'
}
IPTLevel >> initialize [
	self isPlayable: true.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/8/2024 15:19'
}
IPTLevel >> isPlayable [
	^ isPlayable
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/8/2024 15:19'
}
IPTLevel >> isPlayable: anObject [
	isPlayable := anObject
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
	#'squeak_changestamp' : 'Felix Knöfel 7/8/2024 15:38'
}
IPTLevel >> requiredAssert: aBooleanOrBlock description: aStringOrBlock [
	aBooleanOrBlock value ifFalse:
		[self
			isPlayable: false;
			fail: aStringOrBlock].

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/8/2024 15:24'
}
IPTLevel >> setUp [
	game := IPTGame new.
	ball := IPTBall new.
	player := IPTPlayer new.
	
	(ball isKindOf: IPTBall) ifTrue: [ball game: game].
	(game isKindOf: IPTGame) ifTrue: [game ball: ball].
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
IPTLevel >> testRunCode [
	self methodToBeTested: (IPTPlayground >> #runCode).
	
]
