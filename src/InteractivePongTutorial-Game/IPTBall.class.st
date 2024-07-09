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
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:42'
}
IPTBall >> checkCollisionWithWalls [
	"Check if the Ball stays inside the bounds if not take action."
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
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:42'
}
IPTBall >> game [
	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:42'
}
IPTBall >> game: aGame [
	game := aGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:42'
}
IPTBall >> initialize [
	"You dont need to set the speed anymore, it should be done in startOver"
	super initialize.
	self 
		color: Color white;
		extent: self defaultExtent;
		speed: self defaultSpeed @ self defaultSpeed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:42'
}
IPTBall >> speed [
	^ speed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:42'
}
IPTBall >> speed: aNumber [
	speed := aNumber.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:42'
}
IPTBall >> startOver [
	"After starting the ball should be in the center of the game and have an initial speed."
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:42'
}
IPTBall >> step [
	"You should now also check for Collisions with walls."
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:42'
}
IPTBall >> stepTime [
	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:42'
}
IPTBall >> turnHorizontal [
	self speed: self speed x negated @ self speed y.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:42'
}
IPTBall >> turnVertical [
	self speed: self speed x @ self speed y negated.
]
