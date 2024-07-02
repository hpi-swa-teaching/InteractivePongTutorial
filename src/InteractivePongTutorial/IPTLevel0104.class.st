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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/2/2024 11:31'
}
IPTLevel0104 class >> explanations [
	
	^ {
	'In the last level we needed to set the postion of the ball manually to be able to see it. Now we want to be able to reset the ball for example if it hits the wall, therefore you will need to implement the new method startOver.'.
	'It would be boring if the ball would always start with the same direction, therefore try to set the direction randomly but still use defaultSpeed. Also dont forget to put the ball in the center of the game.'.
	'Until now the ball just moves in one direction, we want it to bounce off the top and bottom walls. The walls on the left and right side should reset the ball on collision. Test the collision by comparing the position of the ball with the top, bottom, left and right of the game.'.
	'If you are unsure how to proceed or a stuck at a method there are some hints following.'.
	'Hint 1: You can use {1 . -1} atRandom for a random positive or negative Value'.
	'Hint 2: To check if a value is in between to Numbers you can use between: aNumber and: aNumber.'.
	}.
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
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 20:49'
}
IPTLevel0104 >> test_Game_initialize [
	self testedMethod: (IPTGame >> #initialize).
		
	self assert: game color equals: Color black description: 'You did not choose the right color!'.
]
