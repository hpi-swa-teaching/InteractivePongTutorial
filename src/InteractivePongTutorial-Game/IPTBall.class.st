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
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTBall >> checkCollisionWithPlayer [
	
]

{
	#category : #collision,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
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
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTBall >> game [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTBall >> game: aGame [
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTBall >> initialize [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTBall >> speed [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTBall >> speed: aNumber [
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTBall >> startOver [
	
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTBall >> step [
	
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTBall >> stepTime [
	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTBall >> turnHorizontal [
	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTBall >> turnVertical [
	
]
