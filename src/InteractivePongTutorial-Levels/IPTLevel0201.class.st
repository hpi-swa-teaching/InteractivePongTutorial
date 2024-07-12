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
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 15:52'
}
IPTLevel0201 class >> explanations [
	
	^ {'Until now we only had a game and a ball bouncing around in it. To be able to really call it a game you should now implement the IPTPlayer class for some action.'.
		'Similiar to how you went about implementing the Ball, you will now first write an initialize Method for the player and then the initializePlayers method for the game. Be aware that you need to set two Players. Looking at the getter and setter may help.'.
		'If you are unsure how to proceed or a stuck at a method there are some hints following.'.
		'Hint 1: You need to create two players in initializePlayers, playerLeft and playerRight. They should be placed "offset" away from the center of the game. Don´t forget to add the Morphs.'.}.
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
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 16:03'
}
IPTLevel0201 class >> visibleMethods [

	^ {
		IPTGame>>#initializeBall.
		IPTGame>>#initializePlayers.
		IPTGame>>#playerLeft.
		IPTGame>>#playerLeft:.
		IPTGame>>#playerRight.
		IPTGame>>#playerRight:.
		
		IPTPlayer>>#initialize.
		IPTPlayer>>#game.
		IPTPlayer>>#game:.
		IPTPlayer>>#defaultExtent.
		IPTPlayer>>#speed.
		IPTPlayer>>#speed:.
		
		IPTBall>>#initialize
		}.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 15:49'
}
IPTLevel0201 >> testGameInitializePlayers [
	
	| offset | 
	offset := (game extent x / 2 - 30 @ 0).
	self methodToBeTested: (IPTGame >> #initializePlayers).
	
	game initializePlayers.
	self assert: (game playerLeft isKindOf: IPTPlayer) description: 'Left player should be of class Player'.
	self assert: (game playerRight isKindOf: IPTPlayer) description: 'Right player should be of class Player'.
	self assert: (game center - offset = game playerLeft center) description: 'You should position the left player in the center of the game minus the offset'.
	self assert: (game center + offset = game playerRight center) description: 'You should position the left player in the center of the game plus the offset'.
	self assert: (game submorphs anySatisfy: [ :subm | subm = game playerLeft ]) description: 'Left player should be a submorph of game'.
	self assert: (game submorphs anySatisfy: [ :subm | subm = game playerRight ]) description: 'Right player should be a submorph of game'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 15:58'
}
IPTLevel0201 >> testPlayerInitialize [
	
	self methodToBeTested: (IPTPlayer >> #initialize).
	
	self assert: (player isKindOf: IPTPlayer) description: 'You may not return a value!'.
	self assert: player color isNil not description: 'Have you initialized the morph?'.
	self assert: (player color = Color white) description: 'You did not choose the right color!'.
	self assert: (player extent = player defaultExtent) description: 'You should set the extent to defaultExtent!'.
	self assert: (player speed = 0) description: 'You should set the players speed to 0!'.
]
