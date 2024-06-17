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
	#'squeak_changestamp' : 'Felix Knöfel 6/17/2024 11:55'
}
IPTTestObject >> aMethodWithParam: aParam [
	^ 'Hello AAAAAAAAHHHHHHH'
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
	#'squeak_changestamp' : 'Felix Knöfel 6/17/2024 13:08'
}
IPTTestObject >> aNormalMethod [
	^ 'Hello Whuhhuorld'
]
