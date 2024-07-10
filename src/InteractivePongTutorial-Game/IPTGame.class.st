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
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTGame >> ball [
	^ ball.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTGame >> ball: aBall [
	ball := aBall.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTGame >> handlesKeyboard: anEvent [
	"Return true to enable Keyboard handling."
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTGame >> initialize [
	super initialize.
	self 
		color: Color black;
		beSticky.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTGame >> initializeBall [
	self 
		ball: (IPTBall new game: self);
		addMorph: self ball.
	self ball startOver.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTGame >> initializePlayers [
	| offset | 
	offset := (self extent x / 2 - 30 @ 0).
	self
		playerLeft: (IPTPlayer new
			center: self center - offset;
			game: self);
		playerRight: (IPTPlayer new
			center:  self center + offset;
			game: self);
		addMorph: self playerLeft;
		addMorph: self playerRight.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTGame >> keyDown: anEvent [
	"Let left Player move on W/S an right player on arrowUp/arrowDown"
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTGame >> keyUp: anEvent [
	"Stop movement on key release. W/S for the left and arrowUp/arrowDown for right Player. Try using 'or:' or 'anySatisfy:'"
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
	#'squeak_changestamp' : 'JZ 5/22/2024 16:25'
}
IPTGame >> playerBounds [
	^ {self playerLeft bounds . self playerRight bounds}.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTGame >> playerLeft [
	^ playerLeft.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTGame >> playerLeft: aPlayer [
	playerLeft := aPlayer.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTGame >> playerRight [
	^ playerRight.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/10/2024 18:23'
}
IPTGame >> playerRight: aPlayer [
	playerRight := aPlayer.
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
