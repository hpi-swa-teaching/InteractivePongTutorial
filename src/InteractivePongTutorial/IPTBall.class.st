Class {
	#name : #IPTBall,
	#superclass : #Morph,
	#instVars : [
		'game',
		'speed'
	],
	#category : #InteractivePongTutorial
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'JZ 5/22/2024 13:57'
}
IPTBall class >> on: aGame [
 
	^ self new 
		game: aGame
]

{
	#category : #collision,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:26'
}
IPTBall >> checkCollisionWithPlayer [

	(self game playerBounds anySatisfy: [:bounds | bounds intersects: self bounds])
			ifTrue: [self turnHorizontal].
]

{
	#category : #collision,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:23'
}
IPTBall >> checkCollisionWithWalls [

	(self position x between: self game left and: self game right - self width)
		ifFalse: [self startOver].
	(self position y between: self game top and: self game bottom - self height)
		ifFalse: [self turnVertical].
]

{
	#category : #collision,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:24'
}
IPTBall >> checkCollisions [
	self checkCollisionWithWalls.
	self checkCollisionWithPlayer.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:07'
}
IPTBall >> defaultSpeed [

	^ 5.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:57'
}
IPTBall >> game [

	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:07'
}
IPTBall >> game: aGame [

	game := aGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JZ 5/22/2024 14:19'
}
IPTBall >> initialize [ 

	super initialize.
	self
		color: Color white;
		extent: 17 @ 17.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:07'
}
IPTBall >> speed [

	^ speed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:07'
}
IPTBall >> speed: aNumber [

	speed := aNumber.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JZ 5/22/2024 14:01'
}
IPTBall >> startOver [

	self 
		position: (self game center x - (self width / 2)) @ 
					(self game center y - (self height / 2));
		speed: (self defaultSpeed * #(1 -1) atRandom) @ (self defaultSpeed * #(1 -1) atRandom)
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:24'
}
IPTBall >> step [

	self position: self position + self speed.
	self checkCollisions. 
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:08'
}
IPTBall >> stepTime [

	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JZ 5/22/2024 14:02'
}
IPTBall >> turnHorizontal [

	self speed: self speed x negated @ self speed y.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JZ 5/22/2024 14:02'
}
IPTBall >> turnVertical [

	self speed: self speed x @ self speed y negated.
]
