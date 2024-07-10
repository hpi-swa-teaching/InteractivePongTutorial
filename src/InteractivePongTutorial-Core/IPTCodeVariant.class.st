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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:16'
}
IPTCodeVariant >> chapterNumber [

	^ chapterNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:16'
}
IPTCodeVariant >> chapterNumber: aNumber [

	chapterNumber := aNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:16'
}
IPTCodeVariant >> initialCode [

	^ initialCode.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:16'
}
IPTCodeVariant >> initialCode: aString [

	initialCode := aString.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:16'
}
IPTCodeVariant >> levelIndex [

	^ levelIndex.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:16'
}
IPTCodeVariant >> levelIndex: aNumber [

	levelIndex := aNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:16'
}
IPTCodeVariant >> readOnly [

	^ readOnly.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:17'
}
IPTCodeVariant >> readOnly: aBoolean [

	readOnly := aBoolean.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:17'
}
IPTCodeVariant >> solutionCode [

	^ solutionCode.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:17'
}
IPTCodeVariant >> solutionCode: aString [

	solutionCode := aString.
]
