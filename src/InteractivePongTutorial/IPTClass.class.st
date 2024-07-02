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
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 14:51'
}
IPTClass class >> ballClass [
	^ IPTClass new 
		name: 'IPTBall';
		source: IPTBall;
		methodCodePieces: {
			IPTCodePiece ball_initialize.
			IPTCodePiece ball_game.
			IPTCodePiece ball_game_setter.
			IPTCodePiece ball_speed.
			IPTCodePiece ball_speed_setter.
			IPTCodePiece ball_step.
			IPTCodePiece ball_stepTime.
			IPTCodePiece ball_turnVertical.
			IPTCodePiece ball_turnHorizontal.
			IPTCodePiece ball_checkCollisionWithWalls.
			IPTCodePiece ball_startOver.}
			asOrderedCollection;
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
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 14:51'
}
IPTClass class >> gameClass [
	^ IPTClass new 
		name: 'IPTGame';
		source: IPTGame;
		methodCodePieces: {
			IPTCodePiece game_initialize.
			IPTCodePiece game_initializeBall.
			IPTCodePiece game_ball.
			IPTCodePiece game_ball_setter.}
			asOrderedCollection;
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
