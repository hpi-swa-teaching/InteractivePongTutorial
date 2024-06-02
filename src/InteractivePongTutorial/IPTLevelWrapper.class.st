Class {
	#name : #IPTLevelWrapper,
	#superclass : #PluggableListItemWrapper,
	#instVars : [
		'parent'
	],
	#category : #InteractivePongTutorial
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 17:00'
}
IPTLevelWrapper class >> with: aIPTLevel model: aModel parent: aParent [
	
	^self new
		setItem: aIPTLevel model: aModel parent: aParent
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 16:56'
}
IPTLevelWrapper >> asString [
	^self item LevelName
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 16:57'
}
IPTLevelWrapper >> parent [
	^ parent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 16:57'
}
IPTLevelWrapper >> parent: aChapter [
	parent := aChapter
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 17:12'
}
IPTLevelWrapper >> setItem: anIPTLevel model: aModel parent: itemParent [

	self parent: itemParent.
	self setItem: anIPTLevel model: aModel
]
