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
	#category : #creating,
	#'squeak_changestamp' : 'Josua Zehner 6/20/2024 11:58'
}
IPTCodePiece class >> fromFile: aFilePath [
	| methodInfos fileContents |
	methodInfos := (aFilePath splitBy: '/' ) allButFirst allButFirst.
	fileContents := ((GitAssetLoader for: 'InteractivePongTutorial') loadString: aFilePath) splitBy: '°°°°°'.
	^ self new
		methodToBeChanged: ((Smalltalk at: methodInfos first asSymbol) >> (methodInfos second splitBy: '.') first  asSymbol);
		head: fileContents first withBlanksTrimmed;
	 	variants: (fileContents allButFirst collect: [:variantString | IPTCodeVariant fromString: variantString]).
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
	#category : #loading,
	#'squeak_changestamp' : 'Josua Zehner 6/20/2024 11:53'
}
IPTCodePiece >> loadInitialCodeForLevel: aLevelIndex andChapter: aChapterNumber [
	self code: (self addHeadToCode: (self variantForLevel: aLevelIndex fromChapter: aChapterNumber) initialCode).
]

{
	#category : #loading,
	#'squeak_changestamp' : 'Josua Zehner 6/20/2024 11:53'
}
IPTCodePiece >> loadSolutionCodeForLevel: aLevelIndex andChapter: aChapterNumber [
	self code: (self addHeadToCode: (self variantForLevel: aLevelIndex fromChapter: aChapterNumber) solutionCode).
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
	#'squeak_changestamp' : 'Josua Zehner 6/20/2024 11:51'
}
IPTCodePiece >> variantForLevel: aLevelIndex fromChapter: aChapterNumber [
	^ self variants reversed detect: [:variant | variant levelIndex <= aLevelIndex and: variant chapterNumber <= aChapterNumber].
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
