Class {
	#name : #IPTLevel0301,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/10/2024 19:01'
}
IPTLevel0301 class >> asString [

	^ 'Level 01: Ball Player Collision'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 7/12/2024 19:13'
}
IPTLevel0301 class >> description [
	
	^ 'In this Level, you will learn about detecting when the ball touches a player'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 7/12/2024 19:17'
}
IPTLevel0301 class >> explanations [
	
	^ {'We want the ball to check if it collides with one of players. For that, the ball needs to know where the players are and how big they are. This information is held by playerBounds.'.
	'Then, actually check for a collision in checkCollisionWithPlayer. Luckily, you do not need to implement all the details yourself since Squeak already provides a function that does what we want.'.
	'Now, since the ball could start colliding with a player on every new step it takes, we therefore want to check on every step of the ball if there is a collision happening. We do this by calling the function we just wrote.'.
	'Hint: playerBounds is a collection, where every entry are the bounds of one player'.
	'Hint: checkCollisionWithPlayer checks for collision between ball and every player. So we need to look at every entry of our playerBounds collection.'.
	'Hint: To recall: step is called every time we want to move the ball. So we will then need to check for collisions, too.'}.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/10/2024 19:03'
}
IPTLevel0301 class >> levelIndex [

	^ 1.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/10/2024 19:02'
}
IPTLevel0301 class >> visibleMethods [

	^ {IPTGame>>#initialize.
		IPTGame>>#initializeBall.
		IPTGame>>#initializePlayers.
		IPTGame>>#playerLeft.
		IPTGame>>#playerLeft:.
		IPTGame>>#playerRight.
		IPTGame>>#playerRight:.
		IPTGame>>#playerBounds.
		IPTGame>>#keyUp:.
		IPTGame>>#keyDown:.
		IPTGame>>#handlesKeyboard:.
		
		
		IPTBall>>#turnHorizontal.
		IPTBall>>#step. 
		IPTBall>>#turnVertical. 
		IPTBall>>#initialize.
		IPTBall>>#checkCollisionWithWalls. 
		IPTBall>>#checkCollisionWithPlayer. 
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
