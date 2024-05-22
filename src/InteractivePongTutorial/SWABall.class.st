Class {
	#name : #SWABall,
	#superclass : #RectangleMorph,
	#instVars : [
		'game',
		'speed'
	],
	#category : #InteractivePongTutorial
}

{
	#category : #constants,
	#'squeak_changestamp' : 'mp 11/5/2013 14:02:42.157'
}
SWABall class >> maxSpeed [

	^ 6
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mp 11/5/2013 14:02:49.384'
}
SWABall class >> on: aSwaPong [
 
	^ self new 
		game: aSwaPong
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mp 11/5/2013 14:02:45.079'
}
SWABall class >> scope [

	^  20 @ 20
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 11/5/2013 12:11:17.412'
}
SWABall >> game [

	^ game
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 11/5/2013 12:11:17.426'
}
SWABall >> game: anObject [

	game := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mp 11/5/2013 14:02:22.01'
}
SWABall >> initialize [ 

	super initialize.
	self 
		borderWidth:  0;
		color: Color white;
		extent: self class scope.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mp 11/5/2013 14:01:16.498'
}
SWABall >> randomSpeed [

	self speed: (self class maxSpeed atRandom * #(1 -1) atRandom) @ 
				((self class maxSpeed atRandom / 2) asInteger * #(1 -1) atRandom).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 11/5/2013 12:11:17.434'
}
SWABall >> speed [

	^ speed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 11/5/2013 12:11:17.442'
}
SWABall >> speed: anObject [

	speed := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mp 11/5/2013 14:01:30.178'
}
SWABall >> startOver [

	self position: (self game center x - (self width / 2)) @ 
					(self game center y - (self height / 2));
		randomSpeed.
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'mp 11/5/2013 14:01:48.959'
}
SWABall >> step [

	self position: (self position x + self speed x) @ (self position y + self speed y).
	self game checkCollisions. 
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mp 11/5/2013 14:02:30.899'
}
SWABall >> stepTime [

	^ 25 
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mp 11/5/2013 14:01:55.88'
}
SWABall >> switchHorizontalSpeed [

	self speed: self speed x negated @ self speed y.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mp 11/5/2013 14:01:58.99'
}
SWABall >> switchVerticalSpeed [

	self speed: self speed x @ self speed y negated.
]
