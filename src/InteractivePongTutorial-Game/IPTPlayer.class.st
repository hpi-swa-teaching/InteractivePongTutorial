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
	#'squeak_changestamp' : 'FH 7/10/2024 10:20'
}
IPTPlayer >> defaultSpeed [
	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'FH 7/10/2024 10:20'
}
IPTPlayer >> down [
	"Set the speed to defaultSpeed."
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 10:20'
}
IPTPlayer >> game [
	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 10:20'
}
IPTPlayer >> game: aGame [
	game := aGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FH 7/10/2024 10:20'
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
	#'squeak_changestamp' : 'FH 7/10/2024 10:20'
}
IPTPlayer >> move: aNumber [
	"Add the number to our center. Clamp the new center y component to the game border by using this offset."
	| offset |
	offset := self height * 0.5.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 10:20'
}
IPTPlayer >> speed [
	^ speed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 10:20'
}
IPTPlayer >> speed: aNumber [
	speed := aNumber.
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'FH 7/10/2024 10:20'
}
IPTPlayer >> step [
	"Call move with the speed."
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
	#'squeak_changestamp' : 'FH 7/10/2024 10:20'
}
IPTPlayer >> stop [
	"Set the speed to 0."
]

{
	#category : #movement,
	#'squeak_changestamp' : 'FH 7/10/2024 10:20'
}
IPTPlayer >> up [
	"Set the speed to negated defaultSpeed."
]
