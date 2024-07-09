Class {
	#name : #IPTPlayer,
	#superclass : #Morph,
	#instVars : [
		'game',
		'speed'
	],
	#category : #'InteractivePongTutorial-Game'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 5/22/2024 17:02'
}
IPTPlayer >> defaultSpeed [

	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:09'
}
IPTPlayer >> down [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:09'
}
IPTPlayer >> game [
	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:09'
}
IPTPlayer >> game: aGame [
	game := aGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:09'
}
IPTPlayer >> initialize [
	"Please set the color to white, extent to 15x100 and speed to 0"
	super initialize.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:09'
}
IPTPlayer >> move: aNumber [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:09'
}
IPTPlayer >> speed [
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:09'
}
IPTPlayer >> speed: aNumber [
	
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:09'
}
IPTPlayer >> step [
	
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'JZ 5/22/2024 16:51'
}
IPTPlayer >> stepTime [
	^ 10.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:09'
}
IPTPlayer >> stop [
	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:09'
}
IPTPlayer >> up [
	
]
