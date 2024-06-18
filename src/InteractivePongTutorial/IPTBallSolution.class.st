Class {
	#name : #IPTBallSolution,
	#superclass : #'IPT__TEST',
	#instVars : [
		'game',
		'speed'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #collision,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:26'
}
IPTBallSolution >> checkCollisionWithPlayer [

	(self game playerBounds anySatisfy: [:bounds | bounds intersects: self bounds])
			ifTrue: [self turnHorizontal].
]

{
	#category : #collision,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:23'
}
IPTBallSolution >> checkCollisionWithWalls [

	(self position x between: self game left and: self game right - self width)
		ifFalse: [self startOver].
	(self position y between: self game top and: self game bottom - self height)
		ifFalse: [self turnVertical].
]

{
	#category : #collision,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:24'
}
IPTBallSolution >> checkCollisions [
	self checkCollisionWithWalls.
	self checkCollisionWithPlayer.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 09:50'
}
IPTBallSolution >> defaultSpeed [

	^ 10.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:57'
}
IPTBallSolution >> game [

	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:07'
}
IPTBallSolution >> game: aGame [

	game := aGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JZ 5/22/2024 14:19'
}
IPTBallSolution >> initialize [ 

	super initialize.
	self
		color: Color white;
		extent: 17 @ 17.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:07'
}
IPTBallSolution >> speed [

	^ speed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:07'
}
IPTBallSolution >> speed: aNumber [

	speed := aNumber.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JZ 5/22/2024 14:01'
}
IPTBallSolution >> startOver [

	self 
		position: (self game center x - (self width / 2)) @ 
					(self game center y - (self height / 2));
		speed: (self defaultSpeed * #(1 -1) atRandom) @ (self defaultSpeed * #(1 -1) atRandom)
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:24'
}
IPTBallSolution >> step [

	self position: self position + self speed.
	self checkCollisions. 
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:08'
}
IPTBallSolution >> stepTime [

	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JZ 5/22/2024 14:02'
}
IPTBallSolution >> turnHorizontal [

	self speed: self speed x negated @ self speed y.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JZ 5/22/2024 14:02'
}
IPTBallSolution >> turnVertical [

	self speed: self speed x @ self speed y negated.
]
