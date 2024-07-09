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
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 14:41'
}
IPTLevel0201 class >> visibleMethods [

	^ {{IPTGame. #initialize}. 
		{IPTGame. #initializeBall}.
		{IPTGame. #initializePlayers}.
		{IPTGame. #playerLeft}.
		{IPTGame. #playerLeft:}.
		{IPTGame. #playerRight}.
		{IPTGame. #playerRight:}.
		
		{IPTBall. #turnHorizontal}. 
		{IPTBall. #step}. 
		{IPTBall. #turnVertical}. 
		{IPTBall. #initialize}.
		{IPTBall. #checkCollisionWithWalls}. 
		{IPTBall. #startOver}.
		
		{IPTPlayer. #initialize}.
		{IPTPlayer. #game}.
		{IPTPlayer. #game:}
		}.
]
