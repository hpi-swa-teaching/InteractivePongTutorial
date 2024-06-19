Class {
	#name : #IPTGameSolution,
	#superclass : #'IPT__TEST',
	#instVars : [
		'playerLeft',
		'playerRight',
		'ball'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'JZ 5/22/2024 13:53'
}
IPTGameSolution class >> open [
	self new openInWorld
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:59'
}
IPTGameSolution >> ball [

	^ ball.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:00'
}
IPTGameSolution >> ball: aBall [

	ball := aBall.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JZ 5/22/2024 14:46'
}
IPTGameSolution >> handlesKeyboard: anEvent [

	^ true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 10:34'
}
IPTGameSolution >> initialize [

	super initialize.
	self 
		extent: (100@100);
		color: Color black;
		beSticky.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 6/18/2024 17:22'
}
IPTGameSolution >> initializeBall [
		
	self
		ball: (IPTBallSolution new game: self);
		addMorph: self ball.
	self ball startOver.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 11:04'
}
IPTGameSolution >> initializePlayers [
	
	self
		playerLeft: (IPTPlayerSolution new
			position: self position + (15 @ (self extent y / 2-50));
			game: self);
		playerRight: (IPTPlayerSolution new
			position:  self position + (self extent x - 30 @ (self extent y / 2-50));
			game: self);
		addMorph: self playerLeft;
		addMorph: self playerRight.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 09:47'
}
IPTGameSolution >> keyDown: anEvent [
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
IPTGameSolution >> keyUp: anEvent [
	(anEvent keyCharacter asUppercase = $W ) ifTrue: [self playerLeft stop].
	(anEvent keyCharacter asUppercase = $S) ifTrue: [self playerLeft stop].
	(anEvent keyCharacter = Character arrowUp) ifTrue: [self playerRight stop].
	(anEvent keyCharacter = Character arrowDown) ifTrue: [self playerRight stop].
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JZ 5/22/2024 17:05'
}
IPTGameSolution >> mouseEnter: anEvent [

	anEvent hand newKeyboardFocus: self.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JZ 5/22/2024 17:06'
}
IPTGameSolution >> mouseLeave: anEvent [

	anEvent hand releaseKeyboardFocus: self.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:25'
}
IPTGameSolution >> playerBounds [
	^ {self playerLeft bounds . self playerRight bounds}.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 10/29/2013 12:28:15.175'
}
IPTGameSolution >> playerLeft [

	^ playerLeft
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:00'
}
IPTGameSolution >> playerLeft: aPlayer [

	playerLeft := aPlayer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 10/29/2013 12:28:15.193'
}
IPTGameSolution >> playerRight [

	^ playerRight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 10/29/2013 12:28:15.201'
}
IPTGameSolution >> playerRight: anObject [

	playerRight := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 10:40'
}
IPTGameSolution >> setupWithExtent: aExtent position: aPoint [

	self 
		position: aPoint;
		extent: aExtent;
		initializePlayers;
		initializeBall.
]
