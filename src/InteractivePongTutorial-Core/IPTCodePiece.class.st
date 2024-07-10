"
This class contains the code for its referenced methods and loads it from the Assets.
"
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
	#category : #'InteractivePongTutorial-Core',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 10:42'
}

{
	#category : #creating,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 12:07'
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
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 12:07'
}
IPTCodePiece class >> fromFile: aFilePath [

	| methodInfos fileContents |
	methodInfos := (aFilePath splitBy: '/' ) allButFirst allButFirst.
	fileContents := ((GitAssetLoader for: 'InteractivePongTutorial') loadString: aFilePath) splitBy: '°°°°°'.
	^ self new
		referencedClass: (Smalltalk at: methodInfos first asSymbol);
		referencedMethod: (methodInfos second splitBy: '.') first asSymbol;
		head: fileContents first withBlanksTrimmed;
	 	variants: (self createVariants: fileContents);
		readOnly: false;
		isGreen: false.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:07'
}
IPTCodePiece >> addHeadToCode: aCodeString [

	^ self head, Character cr, Character tab, aCodeString.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:08'
}
IPTCodePiece >> checkSyntax: aString [
	
	self readOnly 
		ifTrue: [^ 'You cannot change this code!'].	

	(((aString splitBy: {Character cr}) at: 1) withBlanksTrimmed = self head)
		ifFalse: [^ 'You must leave the head line unchanged!'].
	
	self code: aString.
	
	^ ''.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 12:09'
}
IPTCodePiece >> code [

	^ code.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:08'
}
IPTCodePiece >> code: aString [

	code := aString.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Josua Zehner 7/6/2024 17:14'
}
IPTCodePiece >> compileCode [

	self referencedClass compile: self code.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:08'
}
IPTCodePiece >> head [

	^ head.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:09'
}
IPTCodePiece >> head: aString [

	head := aString.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:09'
}
IPTCodePiece >> isClass [

	^ self referencedMethod isNil.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:09'
}
IPTCodePiece >> isGreen [

	^ isGreen.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:09'
}
IPTCodePiece >> isGreen: aBoolean [

	isGreen := aBoolean.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 12:11'
}
IPTCodePiece >> isSameSourceAs: aCompiledMethod [
	
	^ (aCompiledMethod selector asSymbol = self referencedMethod) 
		and: (aCompiledMethod methodClass = self referencedClass).
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
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 12:12'
}
IPTCodePiece >> loadSolutionCodeForLevel: aLevelIndex andChapter: aChapterNumber [

	self code: (self addHeadToCode: (self variantForLevel: aLevelIndex fromChapter: aChapterNumber) solutionCode).
	self compileCode.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 12:12'
}
IPTCodePiece >> name [

	^ self referencedMethod asString.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:10'
}
IPTCodePiece >> readOnly [

	^ readOnly.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:10'
}
IPTCodePiece >> readOnly: aBoolean [

	readOnly := aBoolean.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:11'
}
IPTCodePiece >> referencedClass [

	^ referencedClass.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:11'
}
IPTCodePiece >> referencedClass: aClass [

	referencedClass := aClass.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:11'
}
IPTCodePiece >> referencedMethod [

	^ referencedMethod.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:11'
}
IPTCodePiece >> referencedMethod: aMethod [

	referencedMethod := aMethod.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 12:15'
}
IPTCodePiece >> variantForLevel: aLevelIndex fromChapter: aChapterNumber [
	
	^ self variants reversed detect: [:var | 
		var chapterNumber <= aChapterNumber 
			and: (var levelIndex <= aLevelIndex or: var chapterNumber ~= aChapterNumber)].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:12'
}
IPTCodePiece >> variants [

	^ variants.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:12'
}
IPTCodePiece >> variants: aCodePieceVariant [

	variants := aCodePieceVariant.
]
