"
This class contains the Code for the Game of the IPT. It is changed via the Code in the editor.
"
Class {
	#name : #IPTGame,
	#superclass : #Morph,
	#instVars : [
		'playerLeft',
		'playerRight',
		'ball'
	],
	#category : #'InteractivePongTutorial-Game',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 11:19'
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
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 14:51'
}
IPTGame >> ball [
	"Return the value of ball."
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 14:51'
}
IPTGame >> ball: aBall [
	"To update ball you should set ball to the given input."
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 14:51'
}
IPTGame >> handlesKeyboard: anEvent [
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 14:51'
}
IPTGame >> initialize [
	super initialize.
	self 
		color: Color black;
		beSticky.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 14:51'
}
IPTGame >> initializeBall [
	"You should set ball to a new IPTBall and then add the Morph.
	To see it you should also set the position of the ball so it is in the center of the game."
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 14:51'
}
IPTGame >> initializePlayers [
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 14:51'
}
IPTGame >> keyDown: anEvent [
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 14:51'
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
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 14:51'
}
IPTGame >> playerBounds [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 14:51'
}
IPTGame >> playerLeft [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 14:51'
}
IPTGame >> playerLeft: aPlayer [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 14:51'
}
IPTGame >> playerRight [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 14:51'
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
