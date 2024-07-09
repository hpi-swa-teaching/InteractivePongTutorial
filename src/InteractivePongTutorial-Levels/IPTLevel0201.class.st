Class {
	#name : #IPTLevel0201,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 12:48'
}
IPTLevel0201 class >> asString [

	^ 'Level 01: Initialize Player'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 12:48'
}
IPTLevel0201 class >> description [
	
	^ ''.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 12:54'
}
IPTLevel0201 class >> explanations [
	
	^ {''.}.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 12:48'
}
IPTLevel0201 class >> levelIndex [

	^ 1
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 12:53'
}
IPTLevel0201 class >> visibleMethods [

	^ {IPTMethodSelector make: IPTGame >> #initialize readOnly: true. 
		IPTMethodSelector make: IPTGame >> #initializeBall readOnly: true.
		IPTMethodSelector make: IPTGame >> #initializePlayers readOnly: false.
		IPTMethodSelector make: IPTGame >> #playerLeft readOnly: true.
		IPTMethodSelector make: IPTGame >> #playerLeft: readOnly: true.
		IPTMethodSelector make: IPTGame >> #playerRight readOnly: true.
		IPTMethodSelector make: IPTGame >> #playerRight: readOnly: true.
		
		IPTMethodSelector make: IPTBall >> #turnHorizontal readOnly: true. 
		IPTMethodSelector make: IPTBall >> #step readOnly: true. 
		IPTMethodSelector make: IPTBall >> #turnVertical readOnly: true. 
		IPTMethodSelector make: IPTBall >> #initialize readOnly: true.
		IPTMethodSelector make: IPTBall >> #checkCollisionWithWalls readOnly: true. 
		IPTMethodSelector make: IPTBall >> #startOver readOnly: true.
		
		IPTMethodSelector make: IPTPlayer >> #initialize readOnly: false.
		IPTMethodSelector make: IPTPlayer >> #game readOnly: true.
		IPTMethodSelector make: IPTPlayer >> #game: readOnly: true.
		}.
]
