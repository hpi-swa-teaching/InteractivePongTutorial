"
This class contains the Code for the Player of the IPT. It is changed via the Code in the editor.
"
Class {
	#name : #IPTPlayer,
	#superclass : #Morph,
	#instVars : [
		'game',
		'speed'
	],
	#category : #'InteractivePongTutorial-Game',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 11:19'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 7/12/2024 19:11'
}
IPTPlayer >> defaultExtent [
	^ (15@100).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 7/12/2024 19:11'
}
IPTPlayer >> defaultSpeed [
	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'sv 7/12/2024 19:11'
}
IPTPlayer >> down [
	self speed: self defaultSpeed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 7/12/2024 19:11'
}
IPTPlayer >> game [
	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 7/12/2024 19:11'
}
IPTPlayer >> game: aGame [
	game := aGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'sv 7/12/2024 19:11'
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
	#'squeak_changestamp' : 'sv 7/12/2024 19:11'
}
IPTPlayer >> move: aNumber [
	| dist |
	dist := self height * 0.5.
	self center:  (self center x @ (self center y + aNumber 
		min: (self game bottom - dist) max: (self game top + dist))).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 7/12/2024 19:11'
}
IPTPlayer >> speed [
	^ speed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 7/12/2024 19:11'
}
IPTPlayer >> speed: aNumber [
	speed := aNumber.
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'sv 7/12/2024 19:11'
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
	#'squeak_changestamp' : 'sv 7/12/2024 19:11'
}
IPTPlayer >> stop [
	self speed: 0.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'sv 7/12/2024 19:11'
}
IPTPlayer >> up [
	self speed: self defaultSpeed negated.
]
