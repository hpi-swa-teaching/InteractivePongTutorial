Class {
	#name : #IPTBall,
	#superclass : #Morph,
	#instVars : [
		'game',
		'speed'
	],
	#category : #'InteractivePongTutorial-Game'
}

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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 17:22'
}
IPTBall >> checkCollisions [
	self checkCollisionWithWalls.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:40'
}
IPTBall >> defaultExtent [

	^ (17 @ 17).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 17:36'
}
IPTBall >> defaultSpeed [

	^ 10.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 16:37'
}
IPTBall >> game [
	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 16:37'
}
IPTBall >> game: aGame [
	game := aGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 17:49'
}
IPTBall >> initialize [
	"You should set the speed to defaultSpeed."
	super initialize.
	self 
		color: Color white;
		extent: self defaultExtent;
		speed: self defaultSpeed @ self defaultSpeed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 17:46'
}
IPTBall >> speed [
	^ speed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 17:46'
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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 17:47'
}
IPTBall >> step [
	self position: self position + self speed.
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 17:46'
}
IPTBall >> stepTime [
	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 17:49'
}
IPTBall >> turnHorizontal [
	self speed: self speed x negated @ self speed y.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 17:49'
}
IPTBall >> turnVertical [
	self speed: self speed x @ self speed y negated.
]
