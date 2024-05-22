Class {
	#name : #SWAPong,
	#superclass : #SketchMorph,
	#instVars : [
		'playerLeft',
		'playerRight',
		'playerKeys',
		'ball'
	],
	#category : #InteractivePongTutorial
}

{
	#category : #constants,
	#'squeak_changestamp' : 'mp 11/5/2013 14:03:19.562'
}
SWAPong class >> playerLeftDownKey [

	^ $s
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mp 11/5/2013 14:03:23.458'
}
SWAPong class >> playerLeftUpKey [

	^ $w
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mp 11/5/2013 14:03:26.425'
}
SWAPong class >> playerRightDownKey [

	^ Character arrowDown
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mp 11/5/2013 14:03:29.383'
}
SWAPong class >> playerRightUpKey [

	^ Character arrowUp
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mp 11/5/2013 14:03:32.292'
}
SWAPong class >> positionPlayerLeft [

	^ 30@175
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mp 11/5/2013 14:03:34.884'
}
SWAPong class >> positionPlayerRight [

	^ 550@175
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 11/5/2013 12:13:59.564'
}
SWAPong >> ball [

	^ ball
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 11/5/2013 12:13:59.573'
}
SWAPong >> ball: anObject [

	ball := anObject
]

{
	#category : #'collision detection',
	#'squeak_changestamp' : 'mp 11/5/2013 14:06:26.109'
}
SWAPong >> checkCollisionWithLeftAndRighBorder [

	(self ball position x between: self left and: (self right - self ball width))
		ifFalse: [self ball startOver].
]

{
	#category : #'collision detection',
	#'squeak_changestamp' : 'pre 10/16/2019 17:58'
}
SWAPong >> checkCollisionWithPlayer [

	((self playerLeft bounds intersects: self ball bounds) or: 
		[self playerRight bounds intersects: self ball bounds])
			ifTrue: [self ball switchHorizontalSpeed].
]

{
	#category : #'collision detection',
	#'squeak_changestamp' : 'mp 11/5/2013 14:06:13.711'
}
SWAPong >> checkCollisionWithTopAndBottomBorder [

	(self ball position y between: self top and: self bottom - self ball height)
		ifFalse: [self ball switchVerticalSpeed].
]

{
	#category : #'collision detection',
	#'squeak_changestamp' : 'mp 11/5/2013 14:06:02.828'
}
SWAPong >> checkCollisions [

	self 
		checkCollisionWithTopAndBottomBorder;
		checkCollisionWithLeftAndRighBorder;
		checkCollisionWithPlayer.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'mp 11/5/2013 14:06:54.683'
}
SWAPong >> handlesKeyboard: anEvent [

	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'mp 11/5/2013 14:07:01.856'
}
SWAPong >> handlesMouseOver: anEvent [

	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'mp 11/5/2013 14:07:04.763'
}
SWAPong >> hasFocus [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mp 11/5/2013 14:08:09.251'
}
SWAPong >> initialize [

	super initialize.
	self 
		initializeBackground;
		initializePlayers;
		initializeBall.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mp 11/5/2013 14:08:42.959'
}
SWAPong >> initializeBackground [

	self initializeWith: (ImageReadWriter formFromFileNamed: 
						(FileDirectory uri: 'figures/pong.jpg') fullName).

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mp 11/5/2013 14:09:32.053'
}
SWAPong >> initializeBall [
		
	self
		ball: (SWABall on: self);
		addMorph: self ball.
	self ball startOver.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mp 11/5/2013 14:09:09.831'
}
SWAPong >> initializePlayers [
	
	self
		playerLeft: (SWAPlayer position: self class positionPlayerLeft game: self);
		playerRight: (SWAPlayer position: self class positionPlayerRight game: self);
		addMorph: self playerLeft;
		addMorph: self playerRight.
]

{
	#category : #'parts bin',
	#'squeak_changestamp' : 'mp 11/5/2013 14:09:51.435'
}
SWAPong >> initializeToStandAlone [

	self initialize.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'mp 11/5/2013 14:07:08.025'
}
SWAPong >> keyStroke: anEvent [

	(self playerKeys at: anEvent keyCharacter ifAbsent: []) value.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'pre 10/16/2019 17:58'
}
SWAPong >> mouseEnter: anEvent [

	anEvent hand newKeyboardFocus: self.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'pre 10/16/2019 17:58'
}
SWAPong >> mouseLeave: anEvent [

	anEvent hand releaseKeyboardFocus: self.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 11/5/2013 14:10:01.426'
}
SWAPong >> playerKeys [

	^ playerKeys ifNil: [playerKeys := IdentityDictionary newFrom: {
		self class playerLeftUpKey -> [self playerLeft up].
		self class playerLeftDownKey -> [self playerLeft down].
		self class playerRightUpKey -> [self playerRight up].
		self class playerRightDownKey -> [self playerRight down].}]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 11/5/2013 11:38:44.69'
}
SWAPong >> playerKeys: anObject [

	playerKeys := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 10/29/2013 12:28:15.175'
}
SWAPong >> playerLeft [

	^ playerLeft
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 10/29/2013 12:28:15.184'
}
SWAPong >> playerLeft: anObject [

	playerLeft := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 10/29/2013 12:28:15.193'
}
SWAPong >> playerRight [

	^ playerRight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 10/29/2013 12:28:15.201'
}
SWAPong >> playerRight: anObject [

	playerRight := anObject
]
