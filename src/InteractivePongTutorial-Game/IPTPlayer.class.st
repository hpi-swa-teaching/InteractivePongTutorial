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
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 15:09'
}
IPTPlayer >> defaultSpeed [
	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 15:10'
}
IPTPlayer >> down [
	self speed: self defaultSpeed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 15:09'
}
IPTPlayer >> game [
	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 15:09'
}
IPTPlayer >> game: aGame [
	game := aGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 15:09'
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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 15:10'
}
IPTPlayer >> move: aNumber [
	| offset |
	offset := self height * 0.5.
	self center: self center 
		+ (0 @ (aNumber min: offset max: (self game height - offset))).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 15:09'
}
IPTPlayer >> speed [
	^ speed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 15:09'
}
IPTPlayer >> speed: aNumber [
	speed := aNumber.
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 15:09'
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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 15:09'
}
IPTPlayer >> stop [
	"Set the speed to 0."
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 15:09'
}
IPTPlayer >> up [
	"Set the speed to negated defaultSpeed."
]
