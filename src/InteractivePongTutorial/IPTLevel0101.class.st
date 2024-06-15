Class {
	#name : #IPTLevel0101,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JZ 6/7/2024 14:15'
}
IPTLevel0101 >> description [
	^ 'This is level 01'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:12'
}
IPTLevel0101 >> initialize [
	self 
		levelIndex: 1;
		name: 'Level01'.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/15/2024 13:34'
}
IPTLevel0101 >> testForANormalMethod [
	|obj|
	obj := IPTTestObject new.
	((obj aNormalMethod) = 'Hello World!') ifTrue: [^'your code was correct'.] 
	ifFalse: [^'your code was false'.] .
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/15/2024 12:45'
}
IPTLevel0101 >> tests [
	|dict|
	dict:= Dictionary new
		at: #aNormalMethod put: #testForANormalMethod;
		yourself.
	^dict
]
