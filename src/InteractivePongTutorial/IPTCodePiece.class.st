Class {
	#name : #IPTCodePiece,
	#superclass : #Object,
	#instVars : [
		'methodToBeChanged',
		'variants',
		'code',
		'head'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/18/2024 17:41'
}
IPTCodePiece class >> codePieceCollection [
	^ { self game_initialize.} 
		asOrderedCollection.
]

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
	#'squeak_changestamp' : 'Felix Knöfel 6/18/2024 17:42'
}
IPTCodePiece class >> defaultCodePieces [
	^ { IPTCodePiece new
			methodToBeChanged: (IPTTestObject >> #aNormalMethod);
			head: 'aNormalMethod';
			variants: { 
				IPTCodeVariant new
					levelNumber: 101;
					initialCode:  '^ ', $', 'Hello World', $';
					solutionCode:   '^ ', $', 'This is the right solution', $';
					yourself.
				IPTCodeVariant new
					levelNumber: 102;
					initialCode: '^ ', $', 'Hello Level 2', $';
					solutionCode: '^ ', $', 'This is the right solution for Level 2', $';
					yourself. };
			yourself.
		IPTCodePiece new
			methodToBeChanged: (IPTTestObject >> #aMethodWithParam:);
			head:  'aMethodWithParam: aParam';
			variants: { 
				IPTCodeVariant new
					levelNumber: 1;
					initialCode: '^ ', $', 'Hello World', $';
					solutionCode: '^ ', $', 'This is the right solution', $';
					yourself. };
			yourself.
		IPTCodePiece new
			methodToBeChanged: (IPTTestObject >> #aMethodWithParam:andAlso:);
			head: 'aMethodWithParam: aParam andAlso: anotherParam';
			variants: {
				IPTCodeVariant new
					levelNumber: 1;
					initialCode: '^ ', $', 'Hello World', $';
					solutionCode: '^ ', $', 'This is the right solution', $';
					yourself. };
			yourself. } 
			asOrderedCollection.
]

{
	#category : #'game methods',
	#'squeak_changestamp' : 'Felix Knöfel 6/18/2024 17:40'
}
IPTCodePiece class >> game_initialize [
	^ IPTCodePiece new
			methodToBeChanged: (IPTGame >> #initialize);
			head: 'initialize';
			variants: { 
				IPTCodeVariant new
					levelNumber: 101;
					initialCode:  '^ ', $', 'Hello World', $';
					solutionCode:   '^ ', $', 'This is the right solution', $';
					yourself.
				IPTCodeVariant new
					levelNumber: 102;
					initialCode: '^ ', $', 'Hello Level 2', $';
					solutionCode: '^ ', $', 'This is the right solution for Level 2', $';
					yourself. };
			yourself.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/17/2024 12:19'
}
IPTCodePiece >> addHeadToCode: aCodeString [
	^ self head, Character cr, Character tab, aCodeString.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/17/2024 13:08'
}
IPTCodePiece >> checkSyntaxAndSaveCode: aString [

	"self safelyCompile: aString."
	(((aString splitBy: {Character cr}) at: 1) withBlanksTrimmed = self head)
		ifFalse: [^ 'You must leave the head line unchanged!'].
	
	self methodToBeChanged methodClass compile: aString.
	self code: aString.
	^ ''.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/15/2024 13:34'
}
IPTCodePiece >> code [
	self methodToBeChanged ifNil: [ ^ nil ].
	code ifNil: [ self code: self methodToBeChanged getSource asString ].
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
	#'squeak_changestamp' : 'Felix Knöfel 6/17/2024 11:47'
}
IPTCodePiece >> compressedLevelIndexFor: aLevelIndex fromChapter: aChapterIndex [
	^ 100 * aChapterIndex + aLevelIndex.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/15/2024 13:37'
}
IPTCodePiece >> hasBody [
	^ true.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/17/2024 12:10'
}
IPTCodePiece >> head [
	^ head
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/17/2024 12:10'
}
IPTCodePiece >> head: anObject [
	head := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/17/2024 12:17'
}
IPTCodePiece >> loadInitialCodeForLevel: aLevelIndex andChapter: aChapterIndex [
	self code: (self addHeadToCode: (self variantForLevel: 
		(self compressedLevelIndexFor: aLevelIndex fromChapter: aChapterIndex)) initialCode).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/17/2024 12:18'
}
IPTCodePiece >> loadSolutionCodeForLevel: aLevelIndex andChapter: aChapterIndex [
	self code: (self addHeadToCode: (self variantForLevel: 
		(self compressedLevelIndexFor: aLevelIndex fromChapter: aChapterIndex)) solutionCode).
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
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 15:06'
}
IPTCodePiece >> name [
"Extract method name"

	| paramCount strings|
	strings := self methodToBeChanged literalStrings.
	paramCount := 1 max: self methodToBeChanged tempNames size.
	^ (strings copyFrom: (strings size - paramCount) to: (strings size - 1 )) join.
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
	#'squeak_changestamp' : 'Felix Knöfel 6/15/2024 12:52'
}
IPTCodePiece >> variantForLevel: aLevelIndex [
	^ self variants inject: (self variants at: 1) into: [ :best :current | 
		((current levelNumber <= aLevelIndex) and: (current levelNumber > best levelNumber))
			ifTrue: [current] 
			ifFalse: [best]].
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
