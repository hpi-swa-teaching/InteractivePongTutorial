Class {
	#name : #IPTCodeVariant,
	#superclass : #Object,
	#instVars : [
		'chapterNumber',
		'levelIndex',
		'initialCode',
		'solutionCode'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/20/2024 12:08'
}
IPTCodeVariant class >> fromString: aString [
	|splitString|
	splitString := (aString splitBy: '°°') collect: [:string | string withBlanksTrimmed].
	^ self new
		chapterNumber: splitString first lines first asInteger;
		levelIndex: splitString first lines second asInteger;
		initialCode: splitString second;
		solutionCode: splitString third.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 6/20/2024 10:00'
}
IPTCodeVariant >> chapterNumber [
	^ chapterNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 6/20/2024 10:00'
}
IPTCodeVariant >> chapterNumber: anObject [
	chapterNumber := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 11:40'
}
IPTCodeVariant >> initialCode [
	^ initialCode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 11:40'
}
IPTCodeVariant >> initialCode: anObject [
	initialCode := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 6/20/2024 10:00'
}
IPTCodeVariant >> levelIndex [
	^ levelIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 6/20/2024 10:00'
}
IPTCodeVariant >> levelIndex: anObject [
	levelIndex := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 11:40'
}
IPTCodeVariant >> solutionCode [
	^ solutionCode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 11:40'
}
IPTCodeVariant >> solutionCode: anObject [
	solutionCode := anObject
]
