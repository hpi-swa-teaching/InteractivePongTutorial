Class {
	#name : #IPTLevel0104,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:01'
}
IPTLevel0104 class >> asString [

	^ 'Level 04: Wall collision'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:44'
}
IPTLevel0104 class >> description [
	
	^ 'In this level, you will learn how to check for simple Collisions by implementing the collision between the ball and the walls.'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 12:35'
}
IPTLevel0104 class >> explanations [
	
	^ {''}.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:46'
}
IPTLevel0104 class >> levelIndex [

	^ 4
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 15:54'
}
IPTLevel0104 class >> visibleMethods [

	^ {IPTMethodSelector make: IPTGame >> #initialize readOnly: true. 
		IPTMethodSelector make: IPTGame >> #initializeBall readOnly: false.
		
		IPTMethodSelector make: IPTBall >> #turnHorizontal readOnly: true. 
		IPTMethodSelector make: IPTBall >> #step readOnly: false. 
		IPTMethodSelector make: IPTBall >> #turnVertical readOnly: true. 
		IPTMethodSelector make: IPTBall >> #initialize readOnly: false.
		IPTMethodSelector make: IPTBall >> #checkCollisionWithWalls readOnly: false. 
		IPTMethodSelector make: IPTBall >> #startOver readOnly: false.}.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 12:24'
}
IPTLevel0104 >> testGameInitialize [

	self assert: game color equals: Color black description: 'You did not choose the right color!'.
]
