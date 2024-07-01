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
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 13:59'
}
IPTGame >> ball [
	^ ball.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 13:59'
}
IPTGame >> ball: aBall [
	ball := aBall.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JZ 5/22/2024 14:46'
}
IPTGame >> handlesKeyboard: anEvent [

	^ true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 13:59'
}
IPTGame >> initialize [
	super initialize.
	self 
		extent: (100@100);
		color: Color black;
		beSticky.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 13:59'
}
IPTGame >> initializeBall [
	self 
		ball: (IPTBall new game: self);
		addMorph: self ball.
	self ball position: self center.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/23/2024 15:48'
}
IPTGame >> initializePlayers [

]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 09:47'
}
IPTGame >> keyDown: anEvent [
	Transcript show: anEvent keyCharacter.
	(anEvent keyCharacter asUppercase = $W ) ifTrue: [self playerLeft up].
	(anEvent keyCharacter asUppercase = $S ) ifTrue: [self playerLeft down].
	(anEvent keyCharacter = Character arrowUp) ifTrue: [self playerRight up].
	(anEvent keyCharacter = Character arrowDown) ifTrue: [self playerRight down].
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 09:48'
}
IPTGame >> keyUp: anEvent [
	(anEvent keyCharacter asUppercase = $W ) ifTrue: [self playerLeft stop].
	(anEvent keyCharacter asUppercase = $S) ifTrue: [self playerLeft stop].
	(anEvent keyCharacter = Character arrowUp) ifTrue: [self playerRight stop].
	(anEvent keyCharacter = Character arrowDown) ifTrue: [self playerRight stop].
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
	#'squeak_changestamp' : 'mp 10/29/2013 12:28:15.175'
}
IPTGame >> playerLeft [

	^ playerLeft
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:00'
}
IPTGame >> playerLeft: aPlayer [

	playerLeft := aPlayer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 10/29/2013 12:28:15.193'
}
IPTGame >> playerRight [

	^ playerRight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 10/29/2013 12:28:15.201'
}
IPTGame >> playerRight: anObject [

	playerRight := anObject
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
