Class {
	#name : #IPTPlayer,
	#superclass : #Morph,
	#instVars : [
		'game',
		'speed'
	],
	#category : #'InteractivePongTutorial-Game'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 19:40'
}
IPTPlayer >> defaultSpeed [
	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'FH 7/10/2024 19:40'
}
IPTPlayer >> down [
	self speed: self defaultSpeed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 19:40'
}
IPTPlayer >> game [
	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 19:40'
}
IPTPlayer >> game: aGame [
	game := aGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FH 7/10/2024 19:40'
}
IPTPlayer >> initialize [
	super initialize.
		self 
			color: Color white;
			extent: (15@100);
			speed: 0.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'FH 7/10/2024 19:40'
}
IPTPlayer >> move: aNumber [
	| newPosition |
	newPosition := self position y + aNumber.
	((newPosition - self game position y)
		between: 0
		and: self game height - self height)
			ifTrue: [self position: self position x @ newPosition].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 19:40'
}
IPTPlayer >> speed [
	^ speed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 19:40'
}
IPTPlayer >> speed: aNumber [
	speed := aNumber.
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'FH 7/10/2024 19:40'
}
IPTPlayer >> step [
	self move: self speed.
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:51'
}
IPTPlayer >> stepTime [
	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'FH 7/10/2024 19:40'
}
IPTPlayer >> stop [
	self speed: 0.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'FH 7/10/2024 19:40'
}
IPTPlayer >> up [
	self speed: self defaultSpeed negated.
]
