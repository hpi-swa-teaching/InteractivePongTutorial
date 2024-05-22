Class {
	#name : #IPTGame,
	#superclass : #Morph,
	#instVars : [
		'playerLeft',
		'playerRight',
		'ball'
	],
	#category : #InteractivePongTutorial
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
	#'squeak_changestamp' : 'JZ 5/22/2024 16:59'
}
IPTGame >> ball [

	^ ball.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:00'
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
	#'squeak_changestamp' : 'JZ 5/22/2024 16:27'
}
IPTGame >> initialize [

	super initialize.
	self 
		extent: 800 @ 500;
		color: Color black;
		beSticky;
		initializePlayers;
		initializeBall.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JZ 5/22/2024 13:52'
}
IPTGame >> initializeBall [
		
	self
		ball: (IPTBall on: self);
		addMorph: self ball.
	self ball startOver.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JZ 5/22/2024 14:46'
}
IPTGame >> initializePlayers [
	
	self
		playerLeft: (IPTPlayer position: 30@175 game: self);
		playerRight: (IPTPlayer position: 765@175 game: self);
		addMorph: self playerLeft;
		addMorph: self playerRight.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JZ 5/22/2024 16:30'
}
IPTGame >> keyDown: anEvent [
	(anEvent keyCharacter = $w) ifTrue: [self playerLeft up].
	(anEvent keyCharacter = $s) ifTrue: [self playerLeft down].
	(anEvent keyCharacter = Character arrowUp) ifTrue: [self playerRight up].
	(anEvent keyCharacter = Character arrowDown) ifTrue: [self playerRight down].
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JZ 5/22/2024 16:54'
}
IPTGame >> keyUp: anEvent [
	(anEvent keyCharacter = $w) ifTrue: [self playerLeft stop].
	(anEvent keyCharacter = $s) ifTrue: [self playerLeft stop].
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
