"
This class contains the informations for Level 2 in Chapter 2. It is a Subclass of IPTLevel.
"
Class {
	#name : #IPTLevel0202,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 11:24'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/10/2024 10:06'
}
IPTLevel0202 class >> asString [

	^ 'Level 02: Player Movement'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/10/2024 10:06'
}
IPTLevel0202 class >> description [
	
	^ 'This is a description'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/10/2024 10:07'
}
IPTLevel0202 class >> explanations [
	
	^ {''.}.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/10/2024 10:07'
}
IPTLevel0202 class >> levelIndex [

	^ 2.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/10/2024 10:13'
}
IPTLevel0202 class >> visibleMethods [

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
		IPTPlayer>>#game:.
		IPTPlayer>>#up.
		IPTPlayer>>#down.
		IPTPlayer>>#stop.
		IPTPlayer>>#move:.
		IPTPlayer>>#step.
		IPTPlayer>>#defaultSpeed.
		IPTPlayer>>#speed.
		IPTPlayer>>#speed:
		}.
]
