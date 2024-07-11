"
This class contains the Code necessary for the Levels. Each Level has the Tests for the user code on instance side and the necessary informations on class side.
"
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
	#category : #'InteractivePongTutorial-Levels',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 11:25'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 17:49'
}
IPTLevel class >> asString [

	^ 'IPTLevel'.
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
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 11:22'
}
IPTLevel class >> resultEntryToString: aTestResultEntry [
	
	(aTestResultEntry at: #method)
		ifNotNil: [ :testedMethod |
			^ testedMethod methodClass asString, '>>', testedMethod selector asSymbol,  ' - ', (aTestResultEntry at: #string)]
	 	ifNil: [^ (aTestResultEntry at: #string)].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 11:27'
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
			on: TestFailure do: [:ex | failures add: (Dictionary new
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
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 14:13'
}
IPTLevel >> requiredAssert: aBooleanOrBlock description: aStringOrBlock [

	aBooleanOrBlock value ifFalse: [self
		isPlayable: false;
		fail: aStringOrBlock].

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 14:31'
}
IPTLevel >> requiredShouldntRaiseError: aBlock description: aString [

	^ [ aBlock value ]
		on: Exception
		do: [:e | self 
			isPlayable: false;
			fail: aString, e className, ': ', e messageText].

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 18:24'
}
IPTLevel >> setUp [
	self methodToBeTested: (IPTLevel >> #setUp).
	
	game := IPTGame new.
	(game isKindOf: IPTGame) ifFalse: [^ self].
	[game setupWithExtent: (1000@600) position: (0@0)] 
		on: Exception
		do: [:e | Transcript show: e].
	
	player := game playerLeft.
	ball := game ball.
	
	(ball isKindOf: IPTBall) ifFalse: [
		ball := IPTBall new game: game; yourself].
	(player isKindOf: IPTPlayer) ifFalse: [
		player := IPTPlayer new game: game; yourself].
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
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 17:56'
}
IPTLevel >> testRunCode [
	self methodToBeTested: (IPTPlayground >> #runCode).
	
	self requiredShouldntRaiseError: [IPTGame new setupWithExtent: (1000@600) position: (0@0)] 
		description: 'A fatal error occured during execution: '.
	
]
