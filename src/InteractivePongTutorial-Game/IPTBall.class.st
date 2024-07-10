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
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 11:27'
}
IPTBall >> checkCollisionWithWalls [
	
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
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 11:27'
}
IPTBall >> game [
	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 11:27'
}
IPTBall >> game: aGame [
	game := aGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 11:27'
}
IPTBall >> initialize [
	"You should set the speed to defaultSpeed."
	super initialize.
	self 
		color: Color white;
		extent: self defaultExtent.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 11:27'
}
IPTBall >> speed [
	^ speed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 11:27'
}
IPTBall >> speed: aNumber [
	speed := aNumber.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 11:27'
}
IPTBall >> startOver [
	
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 11:27'
}
IPTBall >> step [
	"Please update the position by the speed of the ball."
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 11:27'
}
IPTBall >> stepTime [
	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 11:27'
}
IPTBall >> turnHorizontal [
	'The change of position in x should be negated.'
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 11:27'
}
IPTBall >> turnVertical [
	'The change of position in y should be negated.'
]
