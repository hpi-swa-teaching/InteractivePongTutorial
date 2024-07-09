Class {
	#name : #IPTCodePiece,
	#superclass : #Object,
	#instVars : [
		'variants',
		'code',
		'head',
		'isGreen',
		'readOnly',
		'referencedMethod',
		'referencedClass',
		'parent'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #creating,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:07'
}
IPTCodePiece class >> createVariants: anAssetContent [
	^ (anAssetContent allButFirst collect: [:variantString | IPTCodeVariant fromString: variantString]) asOrderedCollection
			addFirst: (IPTCodeVariant new
				chapterNumber: 0;
				levelIndex: 0;
				initialCode: '';
				solutionCode: '';
				readOnly: true);
			yourself.
]

{
	#category : #creating,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:08'
}
IPTCodePiece class >> fromFile: aFilePath [

	| methodInfos fileContents |
	methodInfos := (aFilePath splitBy: '/' ) allButFirst allButFirst.
	fileContents := ((GitAssetLoader for: 'InteractivePongTutorial') loadString: aFilePath) splitBy: '°°°°°'.
	^ self new
		referencedClass: (Smalltalk at: methodInfos first asSymbol);
		referencedMethod: (methodInfos second splitBy: '.') first  asSymbol;
		head: fileContents first withBlanksTrimmed;
	 	variants: (self createVariants: fileContents);
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
	#'squeak_changestamp' : 'Josua Zehner 7/6/2024 17:08'
}
IPTCodePiece >> checkSyntax: aString [
	
	self readOnly ifTrue: [^ 'You cannot change this code!'].	

	(((aString splitBy: {Character cr}) at: 1) withBlanksTrimmed = self head)
		ifFalse: [^ 'You must leave the head line unchanged!'].
	
	self code: aString.
	^ ''.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/3/2024 19:41'
}
IPTCodePiece >> code [
	"self source ifNil: [ ^ nil ].
	code ifNil: [ self code: self source getSource asString ]."
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/6/2024 17:14'
}
IPTCodePiece >> compileCode [

	self referencedClass compile: self code.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/3/2024 20:01'
}
IPTCodePiece >> contents [
	"Assuming self is an IPTClass object"
	^ self methodCodePieces collect: [ :each | 
		IPTCodePieceListItemWrapper with: each model: self model parent: self]

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
	#'squeak_changestamp' : 'Josua Zehner 7/3/2024 19:53'
}
IPTCodePiece >> isClass [
	^ self referencedMethod isNil.
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
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:26'
}
IPTCodePiece >> isSameSourceAs: aCompiledMethod [
	
	^ (aCompiledMethod selector asSymbol = self referencedMethod) and: (aCompiledMethod methodClass = self referencedClass).
]

{
	#category : #loading,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:38'
}
IPTCodePiece >> loadInitialCodeForLevel: aLevelIndex andChapter: aChapterNumber [
	
	| variant |
	variant := self variantForLevel: aLevelIndex fromChapter: aChapterNumber.
	self code: (self addHeadToCode: variant initialCode);
		readOnly: variant readOnly;
		compileCode.
]

{
	#category : #loading,
	#'squeak_changestamp' : 'Josua Zehner 7/6/2024 17:08'
}
IPTCodePiece >> loadSolutionCodeForLevel: aLevelIndex andChapter: aChapterNumber [
	self code: (self addHeadToCode: (self variantForLevel: aLevelIndex fromChapter: aChapterNumber) solutionCode).
	self checkSyntax: self code.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/3/2024 19:39'
}
IPTCodePiece >> name [
"Extract method name"
	^ self referencedMethod asString.
"	| paramCount strings|
	strings := self source literalStrings.
	paramCount := 1 max: self source tempNames size.
	^ (strings copyFrom: (strings size - paramCount) to: (strings size - 1 )) join."
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
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/3/2024 19:38'
}
IPTCodePiece >> referencedClass [
	^ referencedClass
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/3/2024 19:38'
}
IPTCodePiece >> referencedClass: anObject [
	referencedClass := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/3/2024 19:38'
}
IPTCodePiece >> referencedMethod [
	^ referencedMethod
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/3/2024 19:38'
}
IPTCodePiece >> referencedMethod: anObject [
	referencedMethod := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/3/2024 19:42'
}
IPTCodePiece >> safelyCompile: aString [
	"We want to make sure the user is not playing any games, like trying to compile new methods into our class"
	| previousMethods newMethods |
	previousMethods := self class methodDict keys copy.
	self referencedClass compile: aString.
	newMethods := self class methodDict keys difference: previousMethods.
	newMethods do: [:each|
		self class removeSelector: each].
	^ newMethods isEmpty
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 13:26'
}
IPTCodePiece >> variantForLevel: aLevelIndex fromChapter: aChapterNumber [
	
	^ self variants reversed detect: [:var | var chapterNumber <= aChapterNumber and: (var levelIndex <= aLevelIndex or: var chapterNumber ~= aChapterNumber)].
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
