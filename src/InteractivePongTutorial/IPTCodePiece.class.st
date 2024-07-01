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
	#category : #'ball methods',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:33'
}
IPTCodePiece class >> ball_checkCollisionWithWalls [
	^ IPTCodePiece fromFile: '/assets/IPTBall/checkCollisionWithWalls.txt'.
]

{
	#category : #'ball methods',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/20/2024 16:52'
}
IPTCodePiece class >> ball_game [
	^ IPTCodePiece fromFile: '/assets/IPTBall/game.txt'.
]

{
	#category : #'ball methods',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/20/2024 16:52'
}
IPTCodePiece class >> ball_game_setter [
	^ IPTCodePiece fromFile: '/assets/IPTBall/game:.txt'.
]

{
	#category : #'ball methods',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/20/2024 16:52'
}
IPTCodePiece class >> ball_initialize [
	^ IPTCodePiece fromFile: '/assets/IPTBall/initialize.txt'.
]

{
	#category : #'ball methods',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:14'
}
IPTCodePiece class >> ball_speed [
	^ IPTCodePiece fromFile: '/assets/IPTBall/speed.txt'.
]

{
	#category : #'ball methods',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:14'
}
IPTCodePiece class >> ball_speed_setter [
	^ IPTCodePiece fromFile: '/assets/IPTBall/speed:.txt'.
]

{
	#category : #'ball methods',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:33'
}
IPTCodePiece class >> ball_startOver [
	^ IPTCodePiece fromFile: '/assets/IPTBall/startOver.txt'.
]

{
	#category : #'ball methods',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:14'
}
IPTCodePiece class >> ball_step [
	^ IPTCodePiece fromFile: '/assets/IPTBall/step.txt'.
]

{
	#category : #'ball methods',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:15'
}
IPTCodePiece class >> ball_stepTime [
	^ IPTCodePiece fromFile: '/assets/IPTBall/stepTime.txt'.
]

{
	#category : #'ball methods',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:15'
}
IPTCodePiece class >> ball_turnHorizontal [
	^ IPTCodePiece fromFile: '/assets/IPTBall/turnHorizontal.txt'.
]

{
	#category : #'ball methods',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:15'
}
IPTCodePiece class >> ball_turnVertical [
	^ IPTCodePiece fromFile: '/assets/IPTBall/turnVertical.txt'.
]

{
	#category : #creating,
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 14:46'
}
IPTCodePiece class >> defaultCodePieces [
	^ { IPTCodePiece new
			source: (IPTTestObject >> #aNormalMethod);
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
			source: (IPTTestObject >> #aMethodWithParam:);
			head:  'aMethodWithParam: aParam';
			variants: { 
				IPTCodeVariant new
					levelNumber: 1;
					initialCode: '^ ', $', 'Hello World', $';
					solutionCode: '^ ', $', 'This is the right solution', $';
					yourself. };
			yourself.
		IPTCodePiece new
			source: (IPTTestObject >> #aMethodWithParam:andAlso:);
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
	#category : #'game methods',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/20/2024 16:39'
}
IPTCodePiece class >> game_ball [
	^ IPTCodePiece fromFile: '/assets/IPTGame/ball.txt'.
]

{
	#category : #'game methods',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/20/2024 16:39'
}
IPTCodePiece class >> game_ball_setter [
	^ IPTCodePiece fromFile: '/assets/IPTGame/ball:.txt'.
]

{
	#category : #'game methods',
	#'squeak_changestamp' : 'Josua Zehner 6/20/2024 12:02'
}
IPTCodePiece class >> game_initialize [
	^ IPTCodePiece fromFile: '/assets/IPTGame/initialize.txt'.
]

{
	#category : #'game methods',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/20/2024 16:33'
}
IPTCodePiece class >> game_initializeBall [
	^ IPTCodePiece fromFile: '/assets/IPTGame/initializeBall.txt'.
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
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 14:42'
}
IPTCodePiece >> checkSyntaxAndSaveCode: aString [

	"self safelyCompile: aString."
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
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 20:34'
}
IPTCodePiece >> isSameSourceAs: aCompiledMethod [
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
