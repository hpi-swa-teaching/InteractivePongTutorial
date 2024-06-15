Class {
	#name : #IPTTestObject,
	#superclass : #Morph,
	#instVars : [
		'game',
		'speed'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 14:49'
}
IPTTestObject >> aMethodWithParam: aParam [
	^ 'Hello Wojbjbjbrld'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 14:58'
}
IPTTestObject >> aMethodWithParam: aParam andAlso: anotherParam [
	^ 'Hello Worlld'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/15/2024 13:35'
}
IPTTestObject >> aNormalMethod [
	^ 'Hello World'
]
