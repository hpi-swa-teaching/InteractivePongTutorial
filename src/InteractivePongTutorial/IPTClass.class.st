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
	#'squeak_changestamp' : 'Felix Knöfel 6/18/2024 17:50'
}
IPTClass class >> classList [
	^ {self gameClass}.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/20/2024 16:40'
}
IPTClass class >> gameClass [
	^ IPTClass new 
		name: 'IPTGame';
		methodCodePieces: {
			IPTCodePiece game_initialize.
			IPTCodePiece game_initializeBall.
			IPTCodePiece game_ball.
			IPTCodePiece game_ball_setter.}
			asOrderedCollection;
		yourself.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 11:22'
}
IPTClass class >> testClass [
	^ IPTClass new 
		name: 'TestClass';
		methodCodePieces: IPTCodePiece defaultCodePieces"{IPTCodePiece defaultCodePiece}";
		yourself.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 11:51'
}
IPTClass class >> testClassList [
	^ {self testClass}.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 19:24'
}
IPTClass >> codeToEditForLevel: aLevelIndex [
	^ nil.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/15/2024 12:29'
}
IPTClass >> copy [
	^ super copy 
		methodCodePieces: self methodCodePieces copy;
		yourself.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/15/2024 13:37'
}
IPTClass >> hasBody [
	^ false
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
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 11:47'
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
