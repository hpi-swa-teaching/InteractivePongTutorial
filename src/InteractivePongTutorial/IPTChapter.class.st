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
	#category : #'InteractivePongTutorial-Levels'
}

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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:31'
}
IPTChapter >> activeLevelNumber [
	^ activeLevelNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:31'
}
IPTChapter >> activeLevelNumber: anObject [
	activeLevelNumber := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:52'
}
IPTChapter >> asString [
	^ self name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:30'
}
IPTChapter >> chapterNumber [
	^ chapterNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:30'
}
IPTChapter >> chapterNumber: anObject [
	chapterNumber := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:31'
}
IPTChapter >> description [
	^ description
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:31'
}
IPTChapter >> description: anObject [
	description := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:31'
}
IPTChapter >> levels [
	^ levels
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:31'
}
IPTChapter >> levels: anObject [
	levels := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:31'
}
IPTChapter >> name [
	^ name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:31'
}
IPTChapter >> name: anObject [
	name := anObject
]
