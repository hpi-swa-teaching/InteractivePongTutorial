Class {
	#name : #IPTPlayerSolution,
	#superclass : #'IPT__TEST',
	#instVars : [
		'game',
		'speed'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:02'
}
IPTPlayerSolution >> defaultSpeed [

	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:44'
}
IPTPlayerSolution >> down [

	self speed: self defaultSpeed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:02'
}
IPTPlayerSolution >> game [

	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:02'
}
IPTPlayerSolution >> game: aGame [

	game := aGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:50'
}
IPTPlayerSolution >> initialize [

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
IPTPlayerSolution >> move: aNumber [
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
IPTPlayerSolution >> speed [

	^ speed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:02'
}
IPTPlayerSolution >> speed: aNumber [
	speed := aNumber.
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:47'
}
IPTPlayerSolution >> step [
	self move: self speed
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:51'
}
IPTPlayerSolution >> stepTime [
	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:44'
}
IPTPlayerSolution >> stop [
	self speed: 0.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:44'
}
IPTPlayerSolution >> up [

	self speed: self defaultSpeed negated.
]
