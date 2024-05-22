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
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 14:13'
}
IPTBall >> defaultSpeed [
	^ 5
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 11/5/2013 12:11:17.412'
}
IPTBall >> game [

	^ game
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 11/5/2013 12:11:17.426'
}
IPTBall >> game: anObject [

	game := anObject
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
	#'squeak_changestamp' : 'mp 11/5/2013 12:11:17.434'
}
IPTBall >> speed [

	^ speed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 11/5/2013 12:11:17.442'
}
IPTBall >> speed: anObject [

	speed := anObject
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
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'JZ 5/22/2024 14:04'
}
IPTBall >> step [

	self position: self position + self speed.
	self game checkCollisions. 
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'JZ 5/22/2024 14:03'
}
IPTBall >> stepTime [

	^ 10
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
