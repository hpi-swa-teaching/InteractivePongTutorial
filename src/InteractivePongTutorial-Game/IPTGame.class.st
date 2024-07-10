Class {
	#name : #IPTGame,
	#superclass : #Morph,
	#instVars : [
		'playerLeft',
		'playerRight',
		'ball'
	],
	#category : #'InteractivePongTutorial-Game'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'JZ 5/22/2024 13:53'
}
IPTGame class >> open [
	self new openInWorld
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 19:09'
}
IPTGame >> ball [
	"Return the value of ball."
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 19:09'
}
IPTGame >> ball: aBall [
	"To update ball you should set ball to the given input."
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'FH 7/10/2024 19:06'
}
IPTGame >> handlesKeyboard: anEvent [
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FH 7/10/2024 19:07'
}
IPTGame >> initialize [
	"Please change the color to black."
	super initialize.
	self 
		color: Color blue;
		beSticky.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FH 7/10/2024 19:09'
}
IPTGame >> initializeBall [
	"You should set ball to a new IPTBall and then add the Morph.
	To see it you should also set the position of the ball so it is in the center of the game."
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FH 7/10/2024 19:07'
}
IPTGame >> initializePlayers [
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'FH 7/10/2024 19:06'
}
IPTGame >> keyDown: anEvent [
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'FH 7/10/2024 19:06'
}
IPTGame >> keyUp: anEvent [
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JZ 5/22/2024 17:05'
}
IPTGame >> mouseEnter: anEvent [

	anEvent hand newKeyboardFocus: self.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JZ 5/22/2024 17:06'
}
IPTGame >> mouseLeave: anEvent [

	anEvent hand releaseKeyboardFocus: self.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 19:06'
}
IPTGame >> playerBounds [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 19:07'
}
IPTGame >> playerLeft [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 19:07'
}
IPTGame >> playerLeft: aPlayer [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 19:07'
}
IPTGame >> playerRight [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 19:07'
}
IPTGame >> playerRight: aPlayer [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 15:46'
}
IPTGame >> setupWithExtent: aExtent position: aPoint [

	self 
		position: aPoint;
		extent: aExtent;
		initializeBall;
		initializePlayers.
]
