"
This class contains the informations for Level 1 in Chapter 2. It is a Subclass of IPTLevel.
"
Class {
	#name : #IPTLevel0201,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 11:24'
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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:36'
}
IPTLevel0201 class >> description [
	
	^ 'In this Level you will implement the Player class and connect it to the already existing game'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:52'
}
IPTLevel0201 class >> explanations [
	
	^ {'Until now we only had a game and a ball bouncing around in it. To be able to really call it a game you should now implement the IPTPlayer class for some action.'.
		'Similiar to how you went about implementing the Ball, you will now first write an initialize Method for the player and then the initializePlayers method for the game. Be aware that you need to set two Players. Looking at the getter and setter may help.'.
		'If you are unsure how to proceed or a stuck at a method there are some hints following.'.
		'Hint 1: To set the speed to 0 you can call the "stop" method on a morph.'.
		'Hint 2: You need to create two players in initializePlayers, playerLeft and playerRight. They should be placed "offset" away from the center of the game. Don´t forget to add the Morphs.'.}.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/10/2024 10:07'
}
IPTLevel0201 class >> levelIndex [

	^ 1.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:40'
}
IPTLevel0201 class >> visibleMethods [

	^ {IPTGame>>#initialize.
		IPTGame>>#initializeBall.
		IPTGame>>#initializePlayers.
		IPTGame>>#playerLeft.
		IPTGame>>#playerLeft:.
		IPTGame>>#playerRight.
		IPTGame>>#playerRight:.
		
		IPTBall>>#turnHorizontal.
		IPTBall>>#step. 
		IPTBall>>#turnVertical. 
		IPTBall>>#initialize.
		IPTBall>>#checkCollisionWithWalls. 
		IPTBall>>#startOver.
		
		IPTPlayer>>#initialize.
		IPTPlayer>>#game.
		IPTPlayer>>#game:
		}.
]
