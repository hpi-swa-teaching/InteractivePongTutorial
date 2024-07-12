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
	#'squeak_changestamp' : 'sv 7/12/2024 18:25'
}
IPTBall >> checkCollisionWithPlayer [
	(self game playerBounds anySatisfy: [:bounds | bounds intersects: self bounds])
			ifTrue: [self turnHorizontal].
]

{
	#category : #collision,
	#'squeak_changestamp' : 'sv 7/12/2024 18:25'
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
	#'squeak_changestamp' : 'sv 7/12/2024 18:25'
}
IPTBall >> defaultSpeed [
	^ 10.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 7/12/2024 18:25'
}
IPTBall >> game [
	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 7/12/2024 18:25'
}
IPTBall >> game: aGame [
	game := aGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'sv 7/12/2024 18:25'
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
	#'squeak_changestamp' : 'sv 7/12/2024 18:25'
}
IPTBall >> speed [
	^ speed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 7/12/2024 18:25'
}
IPTBall >> speed: aNumber [
	speed := aNumber.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'sv 7/12/2024 18:25'
}
IPTBall >> startOver [
	self 
		center: self game center;
		speed: (self defaultSpeed * {1 .-1} atRandom) @ (self defaultSpeed * {1 .-1} atRandom).
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'sv 7/12/2024 18:25'
}
IPTBall >> step [
	self position: self position + self speed.
	self checkCollisionWithWalls;
		checkCollisionWithPlayer.
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'sv 7/12/2024 18:25'
}
IPTBall >> stepTime [
	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'sv 7/12/2024 18:25'
}
IPTBall >> turnHorizontal [
	self speed: self speed x negated @ self speed y.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'sv 7/12/2024 18:25'
}
IPTBall >> turnVertical [
	self speed: self speed x @ self speed y negated.
]
