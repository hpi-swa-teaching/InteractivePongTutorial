Class {
	#name : #IPTMockLevel,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Core-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 7/3/2024 09:37'
}
IPTMockLevel class >> asString [
	^ 'mock level'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 7/3/2024 09:44'
}
IPTMockLevel class >> explanations [

	^ {'Cool explanation'}.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 7/3/2024 09:38'
}
IPTMockLevel class >> levelIndex [

	^ 1.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 7/3/2024 09:46'
}
IPTMockLevel class >> visibleMethods [
	^{}.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'sv 7/3/2024 09:34'
}
IPTMockLevel >> mock [
	self assert: False
]
