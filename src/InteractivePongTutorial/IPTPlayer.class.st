Class {
	#name : #IPTPlayer,
	#superclass : #Morph,
	#instVars : [
		'game',
		'speed'
	],
	#category : #InteractivePongTutorial
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:02'
}
IPTPlayer >> defaultSpeed [

	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:44'
}
IPTPlayer >> down [

	self speed: self defaultSpeed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:02'
}
IPTPlayer >> game [

	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:02'
}
IPTPlayer >> game: aGame [

	game := aGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:50'
}
IPTPlayer >> initialize [

	super initialize.
	self 
		color: Color white;
		extent: 15 @100;
		stop.
	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:04'
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
	#'squeak_changestamp' : 'JZ 5/22/2024 17:02'
}
IPTPlayer >> speed [

	^ speed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:02'
}
IPTPlayer >> speed: aNumber [
	speed := aNumber.
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:47'
}
IPTPlayer >> step [
	self move: self speed
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
	#'squeak_changestamp' : 'JZ 5/22/2024 16:44'
}
IPTPlayer >> stop [
	self speed: 0.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:44'
}
IPTPlayer >> up [

	self speed: self defaultSpeed negated.
]
