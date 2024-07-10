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
	#'squeak_changestamp' : 'FH 7/10/2024 19:06'
}
IPTBall >> checkCollisionWithPlayer [
	
]

{
	#category : #collision,
	#'squeak_changestamp' : 'FH 7/10/2024 19:07'
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
	#'squeak_changestamp' : 'FH 7/10/2024 19:09'
}
IPTBall >> game [
	"Return the value of game."
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 19:09'
}
IPTBall >> game: aGame [
	"To update game you should set game to the given input."
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FH 7/10/2024 19:09'
}
IPTBall >> initialize [
	"Initialize the ball (similar to IPTGame initialize) but set the extent to defaultExtent."
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 19:07'
}
IPTBall >> speed [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 19:07'
}
IPTBall >> speed: aNumber [
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FH 7/10/2024 19:07'
}
IPTBall >> startOver [
	
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'FH 7/10/2024 19:07'
}
IPTBall >> step [
	
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'FH 7/10/2024 19:07'
}
IPTBall >> stepTime [
	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'FH 7/10/2024 19:07'
}
IPTBall >> turnHorizontal [
	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'FH 7/10/2024 19:07'
}
IPTBall >> turnVertical [
	
]
