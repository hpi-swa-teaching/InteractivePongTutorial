Class {
	#name : #IPTLevel0203,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/10/2024 18:11'
}
IPTLevel0203 class >> asString [

	^ 'Level 03: Keyboard Input'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/10/2024 18:00'
}
IPTLevel0203 class >> description [
	
	^ 'This is a description'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/10/2024 18:00'
}
IPTLevel0203 class >> explanations [
	
	^ {''.}.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/10/2024 18:10'
}
IPTLevel0203 class >> levelIndex [

	^ 3.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/10/2024 18:02'
}
IPTLevel0203 class >> visibleMethods [

	^ {IPTGame>>#initialize.
		IPTGame>>#initializeBall.
		IPTGame>>#initializePlayers.
		IPTGame>>#playerLeft.
		IPTGame>>#playerLeft:.
		IPTGame>>#playerRight.
		IPTGame>>#playerRight:.
		IPTGame>>#keyUp:.
		IPTGame>>#keyDown:.
		IPTGame>>#handlesKeyboard:.
		
		
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
