Class {
	#name : #IPTPlayer,
	#superclass : #Morph,
	#instVars : [
		'game',
		'playerType'
	],
	#category : #InteractivePongTutorial
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'JZ 5/22/2024 14:45'
}
IPTPlayer class >> position: aPoint game: aSwaPong [ 

	^ self new
		position: aPoint;
		game: aSwaPong.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JZ 5/22/2024 14:11'
}
IPTPlayer >> down [

	self move: self speed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 10/29/2013 12:21:43.482'
}
IPTPlayer >> game [

	^ game
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mp 10/29/2013 12:21:43.491'
}
IPTPlayer >> game: anObject [

	game := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JZ 5/22/2024 14:18'
}
IPTPlayer >> initialize [

	super initialize.
	self 
		color: Color white;
		extent: 15 @100.
	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mp 11/5/2013 14:04:42.763'
}
IPTPlayer >> move: aNumber [
	| newPosition |
	newPosition := self position y + aNumber.
	((newPosition - self game position y)
		between: 0
		and: self game height - self height)
			ifTrue: [self position: self position x @ newPosition].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 14:38'
}
IPTPlayer >> playerKeys [
	^ (self playerType = #left)
	 	ifTrue: [IdentityDictionary newFrom: {
			$w -> [self up].
			$s -> [self down].}] 
		ifFalse: [ IdentityDictionary newFrom: {
			Character arrowUp -> [self up].
			Character arrowDown -> [self down].}]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 14:34'
}
IPTPlayer >> playerType [
	^ playerType
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 14:34'
}
IPTPlayer >> playerType: anObject [
	playerType := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 14:10'
}
IPTPlayer >> speed [
	^ 10
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JZ 5/22/2024 14:11'
}
IPTPlayer >> up [

	self move: self speed negated.
]
