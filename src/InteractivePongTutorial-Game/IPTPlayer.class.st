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
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTPlayer >> defaultSpeed [
	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTPlayer >> down [
	self speed: self defaultSpeed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTPlayer >> game [
	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTPlayer >> game: aGame [
	game := aGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
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
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTPlayer >> move: aNumber [
	| offset |
	offset := self height * 0.5.
	self center: self center 
		+ (0 @ (aNumber min: offset max: (self game height - offset))).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTPlayer >> speed [
	^ speed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTPlayer >> speed: aNumber [
	speed := aNumber.
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
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
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTPlayer >> stop [
	self speed: 0.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTPlayer >> up [
	self speed: self defaultSpeed negated.
]
