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
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTGame >> ball [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTGame >> ball: aBall [
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTGame >> handlesKeyboard: anEvent [
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
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
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTGame >> initializeBall [
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTGame >> initializePlayers [
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTGame >> keyDown: anEvent [
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
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
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTGame >> playerBounds [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTGame >> playerLeft [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTGame >> playerLeft: aPlayer [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTGame >> playerRight [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
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
