"
This class contains the Code for the Ball of the IPT. It is changed via the Code in the editor.
"
Class {
	#name : #IPTBall,
	#superclass : #Morph,
	#instVars : [
		'game',
		'speed'
	],
	#category : #'InteractivePongTutorial-Game',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 11:19'
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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
}
IPTBall >> game [
	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
}
IPTBall >> game: aGame [
	game := aGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
}
IPTBall >> initialize [
	super initialize.
	self 
		color: Color white;
		extent: self defaultExtent;
		speed: self defaultSpeed @ self defaultSpeed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
}
IPTBall >> speed [
	^ speed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
}
IPTBall >> speed: aNumber [
	speed := aNumber.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
}
IPTBall >> startOver [
	self 
		center: self game center;
		speed: (self defaultSpeed * {1 .-1} atRandom) @ (self defaultSpeed * {1 .-1} atRandom).
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
}
IPTBall >> step [
	self position: self position + self speed.
	self checkCollisionWithWalls.
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
}
IPTBall >> stepTime [
	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
}
IPTBall >> turnHorizontal [
	self speed: self speed x negated @ self speed y.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
}
IPTBall >> turnVertical [
	self speed: self speed x @ self speed y negated.
]
