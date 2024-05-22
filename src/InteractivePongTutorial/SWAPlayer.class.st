Class {
	#name : #SWAPlayer,
	#superclass : #RectangleMorph,
	#instVars : [
		'game'
	],
	#category : #InteractivePongTutorial
}

{
	#category : #constants,
	#'squeak_changestamp' : 'mp 11/5/2013 14:03:06.307'
}
SWAPlayer class >> distance [

	^ 10
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mp 11/5/2013 14:03:10.74'
}
SWAPlayer class >> playerScope [

	^ 20 @ 50
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mp 11/5/2013 14:03:03.034'
}
SWAPlayer class >> position: aPoint game: aSwaPong [

	^ self new
		position: aPoint;
		game: aSwaPong
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mp 11/5/2013 14:03:47.555'
}
SWAPlayer >> down [

	self move: self class distance.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 10/29/2013 12:21:43.482'
}
SWAPlayer >> game [

	^ game
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 10/29/2013 12:21:43.491'
}
SWAPlayer >> game: anObject [

	game := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mp 11/5/2013 14:04:05.463'
}
SWAPlayer >> initialize [

	super initialize.
	self 
		color: Color white;
		borderWidth: 0;
		extent: self class playerScope.
	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mp 11/5/2013 14:04:42.763'
}
SWAPlayer >> move: aNumber [
	| newPosition |
	newPosition := self position y + aNumber.
	((newPosition - self game position y)
		between: 0
		and: self game height - self height)
			ifTrue: [self position: self position x @ newPosition].
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mp 11/5/2013 14:03:52.944'
}
SWAPlayer >> up [

	self move: self class distance negated.
]
