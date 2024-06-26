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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 13:37'
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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 13:37'
}
IPTBall >> game [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 13:37'
}
IPTBall >> game: aGame [
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 13:37'
}
IPTBall >> initialize [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 13:37'
}
IPTBall >> speed [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 13:37'
}
IPTBall >> speed: aNumber [
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 13:37'
}
IPTBall >> startOver [
	
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 13:37'
}
IPTBall >> step [
	
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 13:37'
}
IPTBall >> stepTime [
	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 13:37'
}
IPTBall >> turnHorizontal [
	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 13:37'
}
IPTBall >> turnVertical [
	
]
