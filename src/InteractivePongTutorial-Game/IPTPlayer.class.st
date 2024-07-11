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
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 17:27'
}
IPTPlayer >> defaultExtent [
	^ (15@100).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 17:27'
}
IPTPlayer >> defaultSpeed [
	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 17:29'
}
IPTPlayer >> down [
	self speed: self defaultSpeed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 17:27'
}
IPTPlayer >> game [
	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 17:27'
}
IPTPlayer >> game: aGame [
	game := aGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 17:27'
}
IPTPlayer >> initialize [
	super initialize.
	self 
		color: Color white;
		extent: (15@100);
		speed: 0;
		"let the player move up for testing purposes"
		up.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 17:27'
}
IPTPlayer >> move: aNumber [
	"Add the number to our center. Clamp the new center y component when player gets as close to the game border as dist."
	| dist |
	dist := self height * 0.5.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 17:27'
}
IPTPlayer >> speed [
	^ speed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 17:27'
}
IPTPlayer >> speed: aNumber [
	speed := aNumber.
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 17:27'
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
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 17:29'
}
IPTPlayer >> stop [
	self speed: 0.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 17:29'
}
IPTPlayer >> up [
	self speed: self defaultSpeed negated.
]
