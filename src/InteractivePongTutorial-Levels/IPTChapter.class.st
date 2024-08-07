"
This class contains the informations for necessary for each Chapter.
"
Class {
	#name : #IPTChapter,
	#superclass : #Object,
	#instVars : [
		'chapterNumber',
		'name',
		'description',
		'levels',
		'activeLevelNumber'
	],
	#category : #'InteractivePongTutorial-Levels',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 11:21'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 7/12/2024 19:11'
}
IPTChapter class >> chapterSet [
	^ {IPTChapter 
			withName: 'Welcome!'
			number: 0
			description: 'Welcome to the interactive Pong tutorial for Squeak! Here you can learn how to use Morphs, Classes and keyboard input by creating a simple game.'
			levels: {}.
		IPTChapter 
			withName: 'Introduction'
			number: 1
			description: 'In this Chapter, you will learn about creating and initializing Morphs, as well as moving them and how simple Collisions work. For that you wil be implementing a Game and a Ball Class.'
			levels: {
				IPTLevel0101.
				IPTLevel0102.
				IPTLevel0103.
				IPTLevel0104}. 
		IPTChapter 
			withName: 'Player movement'
			number: 2
			description: 'In this Chapter, we will build our player and make it respond to key presses. You will learn about handling user input in squeak and manipulating Morphs dynamically.'
			levels: {
				IPTLevel0201.
				IPTLevel0202.
				IPTLevel0203}.
		IPTChapter 
			withName: 'Collisions'
			number: 3
			description: 'In this Chapter, we will make the Players and the Ball interact with each other and finish our game off.'
			levels: {
				IPTLevel0301}}
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:47'
}
IPTChapter class >> withName: aName number:  aNumber description: aString levels: aLevelList [
	^ self new
		name: aName;
		chapterNumber: aNumber;
		description: aString;
		levels: aLevelList.
		
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/12/2024 18:56'
}
IPTChapter >> activeLevelNumber [

	^ activeLevelNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/12/2024 18:56'
}
IPTChapter >> activeLevelNumber: aNumber [

	activeLevelNumber := aNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/12/2024 18:56'
}
IPTChapter >> asString [

	^ self name.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/12/2024 18:56'
}
IPTChapter >> chapterNumber [

	^ chapterNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/12/2024 18:56'
}
IPTChapter >> chapterNumber: aNumber [

	chapterNumber := aNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/12/2024 18:56'
}
IPTChapter >> description [

	^ description.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/12/2024 18:56'
}
IPTChapter >> description: aString [

	description := aString.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/12/2024 18:57'
}
IPTChapter >> levels [

	^ levels.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/12/2024 18:58'
}
IPTChapter >> levels: aCollection [

	levels := aCollection.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/12/2024 18:58'
}
IPTChapter >> name [

	^ name.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 7/12/2024 18:58'
}
IPTChapter >> name: aString [

	name := aString.
]
