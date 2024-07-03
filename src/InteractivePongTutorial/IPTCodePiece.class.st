Class {
	#name : #IPTCodePiece,
	#superclass : #Object,
	#instVars : [
		'source',
		'variants',
		'code',
		'head',
		'isGreen',
		'readOnly'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #creating,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 15:50'
}
IPTCodePiece class >> fromFile: aFilePath [
	| methodInfos fileContents |
	methodInfos := (aFilePath splitBy: '/' ) allButFirst allButFirst.
	fileContents := ((GitAssetLoader for: 'InteractivePongTutorial') loadString: aFilePath) splitBy: '°°°°°'.
	^ self new
		source: ((Smalltalk at: methodInfos first asSymbol) >> (methodInfos second splitBy: '.') first  asSymbol);
		head: fileContents first withBlanksTrimmed;
	 	variants: ((fileContents allButFirst collect: [:variantString | IPTCodeVariant fromString: variantString]) asOrderedCollection
			addFirst: (IPTCodeVariant new
				chapterNumber: 0;
				levelIndex: 0;
				initialCode: '';
				solutionCode: '');
			yourself);
		readOnly: false;
		isGreen: false.
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
	#'squeak_changestamp' : 'Felix Knöfel 7/3/2024 11:40'
}
IPTCodePiece >> checkSyntaxAndSaveCode: aString [
	
	self readOnly ifTrue: [^ 'You cannot change this code!'].	

	(((aString splitBy: {Character cr}) at: 1) withBlanksTrimmed = self head)
		ifFalse: [^ 'You must leave the head line unchanged!'].
	
	self source methodClass compile: aString.
	self code: aString.
	^ ''.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 14:42'
}
IPTCodePiece >> code [
	self source ifNil: [ ^ nil ].
	code ifNil: [ self code: self source getSource asString ].
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:07'
}
IPTCodePiece >> isClass [
	^ false.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:47'
}
IPTCodePiece >> isGreen [
	^ isGreen
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:47'
}
IPTCodePiece >> isGreen: anObject [
	isGreen := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 21:33'
}
IPTCodePiece >> isSameSourceAs: aCompiledMethod [
	self isClass ifTrue: [^ false].
	Transcript show: (IPT compiledMethodToString: self source), ' - ', 
	(IPT compiledMethodToString: aCompiledMethod), Character cr.
	
	^ (IPT compiledMethodToString: self source)
		= (IPT compiledMethodToString: aCompiledMethod).
]

{
	#category : #loading,
	#'squeak_changestamp' : 'Felix Knöfel 6/23/2024 23:39'
}
IPTCodePiece >> loadInitialCodeForLevel: aLevelIndex andChapter: aChapterNumber [
	self code: (self addHeadToCode: (self variantForLevel: aLevelIndex fromChapter: aChapterNumber) initialCode).
	self checkSyntaxAndSaveCode: self code.
]

{
	#category : #loading,
	#'squeak_changestamp' : 'Felix Knöfel 6/24/2024 00:27'
}
IPTCodePiece >> loadSolutionCodeForLevel: aLevelIndex andChapter: aChapterNumber [
	self code: (self addHeadToCode: (self variantForLevel: aLevelIndex fromChapter: aChapterNumber) solutionCode).
	self checkSyntaxAndSaveCode: self code.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 14:46'
}
IPTCodePiece >> name [
"Extract method name"

	| paramCount strings|
	strings := self source literalStrings.
	paramCount := 1 max: self source tempNames size.
	^ (strings copyFrom: (strings size - paramCount) to: (strings size - 1 )) join.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 15:50'
}
IPTCodePiece >> readOnly [
	^ readOnly
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 15:50'
}
IPTCodePiece >> readOnly: anObject [
	readOnly := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 14:46'
}
IPTCodePiece >> safelyCompile: aString [
	"We want to make sure the user is not playing any games, like trying to compile new methods into our class"
	| previousMethods newMethods |
	previousMethods := self class methodDict keys copy.
	self source methodClass compile: aString.
	newMethods := self class methodDict keys difference: previousMethods.
	newMethods do: [:each|
		self class removeSelector: each].
	^ newMethods isEmpty
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 14:42'
}
IPTCodePiece >> source [
	^ source
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 14:42'
}
IPTCodePiece >> source: anObject [
	source := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/24/2024 00:00'
}
IPTCodePiece >> variantForLevel: aLevelIndex fromChapter: aChapterNumber [
	| variant |
	variant := self variants reversed detect: [:var | var levelIndex <= aLevelIndex and: var chapterNumber <= aChapterNumber].
	
	^ variant.
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
