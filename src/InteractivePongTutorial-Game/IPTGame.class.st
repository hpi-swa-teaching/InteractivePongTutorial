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
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 18:24'
}
IPTGame >> ball [
	^ ball.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 18:24'
}
IPTGame >> ball: aBall [
	ball := aBall.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 18:24'
}
IPTGame >> handlesKeyboard: anEvent [
	"Return true to enable Keyboard handling."
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 18:24'
}
IPTGame >> initialize [
	super initialize.
	self 
		color: Color black;
		beSticky.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 18:24'
}
IPTGame >> initializeBall [
	self 
		ball: (IPTBall new 
			game: self;
			startOver);
		addMorph: self ball.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 18:24'
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
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 18:24'
}
IPTGame >> keyDown: anEvent [
	"Let left Player move on W/S an right player on arrowUp/arrowDown."
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 18:24'
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
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 18:24'
}
IPTGame >> playerBounds [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 18:24'
}
IPTGame >> playerLeft [
	^ playerLeft.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 18:24'
}
IPTGame >> playerLeft: aPlayer [
	playerLeft := aPlayer.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 18:24'
}
IPTGame >> playerRight [
	^ playerRight.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 18:24'
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
