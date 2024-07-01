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
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:23'
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
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:23'
}
IPTBall >> game [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:23'
}
IPTBall >> game: aGame [
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:23'
}
IPTBall >> initialize [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:23'
}
IPTBall >> speed [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:23'
}
IPTBall >> speed: aNumber [
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:23'
}
IPTBall >> startOver [
	
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:23'
}
IPTBall >> step [
	
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:23'
}
IPTBall >> stepTime [
	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:23'
}
IPTBall >> turnHorizontal [
	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:23'
}
IPTBall >> turnVertical [
	
]
