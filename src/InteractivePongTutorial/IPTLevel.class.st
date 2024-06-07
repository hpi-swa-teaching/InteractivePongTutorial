Class {
	#name : #IPTLevel,
	#superclass : #Object,
	#instVars : [
		'levelNumber',
		'chapterNumber',
		'name',
		'description',
		'tests',
		'tips',
		'visibleCodePieces'
	],
	#category : #'InteractivePongTutorial-Levels'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 11:04'
}
IPTLevel >> asString [
	^ self name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:34'
}
IPTLevel >> chapterNumber [
	^ chapterNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:34'
}
IPTLevel >> chapterNumber: anObject [
	chapterNumber := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:34'
}
IPTLevel >> description [
	^ description
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:34'
}
IPTLevel >> description: anObject [
	description := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:33'
}
IPTLevel >> levelNumber [
	^ levelNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:33'
}
IPTLevel >> levelNumber: anObject [
	levelNumber := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:34'
}
IPTLevel >> name [
	^ name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:34'
}
IPTLevel >> name: anObject [
	name := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:34'
}
IPTLevel >> tests [
	^ tests
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:34'
}
IPTLevel >> tests: anObject [
	tests := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:34'
}
IPTLevel >> tips [
	^ tips
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:34'
}
IPTLevel >> tips: anObject [
	tips := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:34'
}
IPTLevel >> visibleCodePieces [
	^ visibleCodePieces
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:34'
}
IPTLevel >> visibleCodePieces: anObject [
	visibleCodePieces := anObject
]
