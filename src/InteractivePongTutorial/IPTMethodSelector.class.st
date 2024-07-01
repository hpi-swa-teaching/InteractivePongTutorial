Class {
	#name : #IPTMethodSelector,
	#superclass : #Object,
	#instVars : [
		'method',
		'readOnly'
	],
	#category : #'InteractivePongTutorial-Levels'
}

{
	#category : #initialize,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 15:00'
}
IPTMethodSelector class >> make: aCompiledMethod readOnly: aBool [
	^ self new
		method: aCompiledMethod;
		readOnly: aBool.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:58'
}
IPTMethodSelector >> method [
	^ method
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:58'
}
IPTMethodSelector >> method: anObject [
	method := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:58'
}
IPTMethodSelector >> readOnly [
	^ readOnly
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:58'
}
IPTMethodSelector >> readOnly: anObject [
	readOnly := anObject
]
