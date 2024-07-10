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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
}
IPTGame >> ball [
	^ ball.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
}
IPTGame >> initialize [
	super initialize.
	self 
		color: Color black;
		beSticky.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
}
IPTGame >> initializeBall [
	"Instead of setting the Position of the ball you should now call the method starOver."
	self 
		ball: (IPTBall new game: self);
		addMorph: self ball.
	self ball center: self center.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
}
IPTGame >> playerLeft [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
}
IPTGame >> playerLeft: aPlayer [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
}
IPTGame >> playerRight [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:01'
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
