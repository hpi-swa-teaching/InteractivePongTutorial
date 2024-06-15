Class {
	#name : #IPTLevel,
	#superclass : #Object,
	#instVars : [
		'levelIndex',
		'chapterNumber',
		'name',
		'description',
		'tests',
		'tips',
		'visibleMethods'
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
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:10'
}
IPTLevel >> levelIndex [
	^ levelIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:10'
}
IPTLevel >> levelIndex: anObject [
	levelIndex := anObject
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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/15/2024 13:34'
}
IPTLevel >> runTest: aMethodName [
	^(self perform: (self tests at: aMethodName)).
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
	#'squeak_changestamp' : 'Felix Knöfel 6/15/2024 11:52'
}
IPTLevel >> visibleMethods [
	^ visibleMethods
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/15/2024 11:52'
}
IPTLevel >> visibleMethods: anObject [
	visibleMethods := anObject
]
