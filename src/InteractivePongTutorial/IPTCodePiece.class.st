Class {
	#name : #IPTCodePiece,
	#superclass : #Object,
	#instVars : [
		'methodToBeChanged',
		'variants',
		'code'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 11:54'
}
IPTCodePiece class >> defaultCodePiece [
	^ IPTCodePiece new
		methodToBeChanged: (IPTTestObject >> #aNormalMethod);
		variants: { IPTCodeVariant new
			levelNumber: 1;
			initialCode: 'aNormalMethod', Character cr, Character tab, '^ ', $', 'Hello World', $';
			solutionCode:  'aNormalMethod', Character cr, Character tab, '^ ', $', 'This is the right solution', $';
			yourself. };
		yourself.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 11:24'
}
IPTCodePiece class >> defaultCodePieces [
	^ { IPTCodePiece new
			methodToBeChanged: (IPTTestObject >> #aNormalMethod);
			variants: { IPTCodeVariant new
				levelNumber: 1;
				initialCode: 'aNormalMethod', Character cr, Character tab, '^ ', $', 'Hello World', $';
				solutionCode:  'aNormalMethod', Character cr, Character tab, '^ ', $', 'This is the right solution', $';
				yourself. };
			yourself.
		IPTCodePiece new
			methodToBeChanged: (IPTTestObject >> #aMethodWithParam:);
			variants: { IPTCodeVariant new
				levelNumber: 1;
				initialCode: 'aNormalMethod', Character cr, Character tab, '^ ', $', 'Hello World', $';
				solutionCode:  'aNormalMethod', Character cr, Character tab, '^ ', $', 'This is the right solution', $';
				yourself. };
			yourself.
		IPTCodePiece new
			methodToBeChanged: (IPTTestObject >> #aMethodWithParam:andAlso:);
			variants: { IPTCodeVariant new
				levelNumber: 1;
				initialCode: 'aNormalMethod', Character cr, Character tab, '^ ', $', 'Hello World', $';
				solutionCode:  'aNormalMethod', Character cr, Character tab, '^ ', $', 'This is the right solution', $';
				yourself. };
			yourself.}
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 13:49'
}
IPTCodePiece >> checkSyntaxAndSaveCode: aString [

	"self safelyCompile: aString."
	self methodToBeChanged methodClass compile: aString.
	self code: aString.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 13:54'
}
IPTCodePiece >> code [
	code ifNil: [ self code: self methodToBeChanged getSource asString ].
	Transcript show: code.
	^ code.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 13:48'
}
IPTCodePiece >> code: anObject [
	code := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 13:55'
}
IPTCodePiece >> codeToEditForLevel: aLevelIndex [
	^ self code
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 10:29'
}
IPTCodePiece >> methodToBeChanged [
	^ methodToBeChanged
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 10:28'
}
IPTCodePiece >> methodToBeChanged: anObject [
	methodToBeChanged := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 11:41'
}
IPTCodePiece >> name [
| n |
	n := 1 max: self methodToBeChanged tempNames size.
	
	^ (self methodToBeChanged literalStrings take: n) join.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 12:26'
}
IPTCodePiece >> safelyCompile: aString [
	"We want to make sure the user is not playing any games, like trying to compile new methods into our class"
	| previousMethods newMethods |
	previousMethods := self class methodDict keys copy.
	self methodToBeChanged methodClass compile: aString.
	newMethods := self class methodDict keys difference: previousMethods.
	newMethods do: [:each|
		self class removeSelector: each].
	^ newMethods isEmpty
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 11:39'
}
IPTCodePiece >> variants [
	^ variants
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 11:39'
}
IPTCodePiece >> variants: anObject [
	variants := anObject
]
