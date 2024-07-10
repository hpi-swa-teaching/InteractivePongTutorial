"
This class creates the Methodvariants for the different levels. They are loaded from the Assets.
"
Class {
	#name : #IPTCodeVariant,
	#superclass : #Object,
	#instVars : [
		'chapterNumber',
		'levelIndex',
		'initialCode',
		'solutionCode',
		'readOnly'
	],
	#category : #'InteractivePongTutorial-Core',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 11:09'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 13:56'
}
IPTCodeVariant class >> fromString: aString [

	| splitString readOnly |
	splitString := (aString splitBy: '°°') collect: [:string | string withBlanksTrimmed].
	readOnly := (splitString size = 2).
	^ self new
		chapterNumber: splitString first lines first asInteger;
		levelIndex: splitString first lines second asInteger;
		initialCode: splitString second;
		solutionCode: (readOnly ifFalse: [splitString third] ifTrue: [splitString second]);
		readOnly: readOnly.
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
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 13:53'
}
IPTCodeVariant >> readOnly [
	^ readOnly
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 13:53'
}
IPTCodeVariant >> readOnly: anObject [
	readOnly := anObject
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
