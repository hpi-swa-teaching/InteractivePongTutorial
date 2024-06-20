Class {
	#name : #IPTLevel,
	#superclass : #TestCase,
	#instVars : [
		'game'
	],
	#category : #'InteractivePongTutorial-Levels'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:17'
}
IPTLevel class >> asString [

	^ self subclassResponsibility.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:26'
}
IPTLevel class >> description [
	
	^ self subclassResponsibility.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:16'
}
IPTLevel class >> levelIndex [
	
	^ self subclassResponsibility.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 14:29'
}
IPTLevel class >> runTests [
	| suite |
	suite := TestSuite new.
	
	(self allMethodsInCategory: #levelTests) do: [ :method | suite addTest: (self selector: method) ].
	^ suite run.
		"inject: {OrderedCollection new . OrderedCollection new} 
		into: [ :list :selector | |result|
			result := self run: selector.
			list first addAll: result errors.
			list second addAll: result failures.
			list]."
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:17'
}
IPTLevel class >> visibleCodePieces [
	
	^ self subclassResponsibility.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:24'
}
IPTLevel >> setUp [
	game := IPTGame new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:29'
}
IPTLevel >> tearDown [
	game := nil.
]
