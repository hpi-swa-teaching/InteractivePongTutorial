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
	#'squeak_changestamp' : 'mp 11/5/2013 12:13:59.564'
}
IPTGame >> ball [

	^ ball
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 11/5/2013 12:13:59.573'
}
IPTGame >> ball: anObject [

	ball := anObject
]

{
	#category : #'collision detection',
	#'squeak_changestamp' : 'mp 11/5/2013 14:06:26.109'
}
IPTGame >> checkCollisionWithLeftAndRighBorder [

	(self ball position x between: self left and: (self right - self ball width))
		ifFalse: [self ball startOver].
]

{
	#category : #'collision detection',
	#'squeak_changestamp' : 'JZ 5/22/2024 14:02'
}
IPTGame >> checkCollisionWithPlayer [

	((self playerLeft bounds intersects: self ball bounds) or: 
		[self playerRight bounds intersects: self ball bounds])
			ifTrue: [self ball turnHorizontal].
]

{
	#category : #'collision detection',
	#'squeak_changestamp' : 'JZ 5/22/2024 14:02'
}
IPTGame >> checkCollisionWithTopAndBottomBorder [

	(self ball position y between: self top and: self bottom - self ball height)
		ifFalse: [self ball turnVertical].
]

{
	#category : #'collision detection',
	#'squeak_changestamp' : 'mp 11/5/2013 14:06:02.828'
}
IPTGame >> checkCollisions [

	self 
		checkCollisionWithTopAndBottomBorder;
		checkCollisionWithLeftAndRighBorder;
		checkCollisionWithPlayer.
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
	#'squeak_changestamp' : 'JZ 5/22/2024 14:15'
}
IPTGame >> initialize [

	super initialize.
	self 
		extent: 800 @ 500;
		color: Color black;
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
	#'squeak_changestamp' : 'JZ 5/22/2024 15:03'
}
IPTGame >> keyStroke: anEvent [
	(anEvent = $w) ifTrue: [self playerLeft up].
	(anEvent = Character arrowUp) ifTrue: [self playerRight up].
	(self playerKeys at: anEvent keyCharacter ifAbsent: []) value.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JZ 5/22/2024 14:57'
}
IPTGame >> playerKeys [
	^ IdentityDictionary newFrom: {
			$w -> [self playerLeft up].
			$s -> [self playerLeft down].
			
			}
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
	#'squeak_changestamp' : 'mp 10/29/2013 12:28:15.184'
}
IPTGame >> playerLeft: anObject [

	playerLeft := anObject
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
	#category : #'event handling',
	#'squeak_changestamp' : 'JZ 5/22/2024 15:04'
}
IPTGame >> wantsKeyboardFocus [
	^true
]
