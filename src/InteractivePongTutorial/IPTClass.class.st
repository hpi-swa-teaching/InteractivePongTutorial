Class {
	#name : #IPTClass,
	#superclass : #IPTCodePiece,
	#instVars : [
		'name',
		'methodCodePieces'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/2/2024 10:46'
}
IPTClass class >> ballClass [
	^ IPTClass new 
		name: 'IPTBall';
		source: IPTBall;
		methodCodePieces: (IPTAssetLoader methodCodePiecesFor: 'IPTBall');
		yourself.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/20/2024 16:51'
}
IPTClass class >> classList [
	^ {self gameClass. self ballClass.}.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/2/2024 10:46'
}
IPTClass class >> gameClass [
	^ IPTClass new 
		name: 'IPTGame';
		source: IPTGame;
		methodCodePieces: (IPTAssetLoader methodCodePiecesFor: 'IPTGame');
		yourself.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 14:52'
}
IPTClass >> code [
	^ self source definition.
]

{
	#category : #behaviour,
	#'squeak_changestamp' : 'Felix Knöfel 6/24/2024 11:58'
}
IPTClass >> copy [
	^ super copy 
		methodCodePieces: (self methodCodePieces copy);
		yourself.
]

{
	#category : #behaviour,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:08'
}
IPTClass >> isClass [
	^ true
]

{
	#category : #behaviour,
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 14:54'
}
IPTClass >> loadInitialCodeForLevel: aLevelIndex andChapter: aChapterNumber [
	^self shouldNotImplement.
]

{
	#category : #behaviour,
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 14:54'
}
IPTClass >> loadSolutionCodeForLevel: aLevelIndex andChapter: aChapterNumber [
	self shouldNotImplement.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 11:47'
}
IPTClass >> methodCodePieces [
	^ methodCodePieces
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 14:50'
}
IPTClass >> methodCodePieces: anObject [
	methodCodePieces := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 11:52'
}
IPTClass >> name [
	^ name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 11:52'
}
IPTClass >> name: anObject [
	name := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 14:49'
}
IPTClass >> source: aClass [
	^ source := aClass.
]
