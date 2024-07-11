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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:37'
}
IPTLevel0202 class >> description [
	
	^ 'In this Chapter you will implement the foundations of the movement for the Player class'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 15:09'
}
IPTLevel0202 class >> explanations [
	
	^ {'We now have a player but it cant really do much. We want it to be able to move. Therefore you should implement the step and move methods. The step method should be similar to the one you wrote for the ball. '.
		'If you are unsure how to proceed or a stuck at a method there are some hints following.'.
		'Hint 1: You should set the new center of the player by adding a new point with 0 as x value and the input clamped to the game border as y value'.
		'Hint 2: You can clamp the y value by using: "input" min: "upper border" max: "lower border".'.}.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/10/2024 18:01'
}
IPTLevel0202 class >> levelIndex [

	^ 2.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 16:14'
}
IPTLevel0202 class >> visibleMethods [

	^ {
		IPTPlayer>>#initialize.
		IPTPlayer>>#defaultSpeed.
		IPTPlayer>>#up.
		IPTPlayer>>#down.
		IPTPlayer>>#stop.
		IPTPlayer>>#move:.
		IPTPlayer>>#step.
		}.
]
