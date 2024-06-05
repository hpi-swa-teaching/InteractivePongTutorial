Class {
	#name : #IPTMethodListItemWrapper,
	#superclass : #PluggableListItemWrapper,
	#instVars : [
		'parent'
	],
	#category : #InteractivePongTutorial
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:24'
}
IPTMethodListItemWrapper class >> with: anIPTMethod model: aModel parent: aParent [

	^ self new 
		setItem: anIPTMethod model: aModel parent: aParent

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 16:55'
}
IPTMethodListItemWrapper >> asString [
	^ self item.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:25'
}
IPTMethodListItemWrapper >> parent [
	^ parent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:25'
}
IPTMethodListItemWrapper >> parent: anObject [
	parent := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:23'
}
IPTMethodListItemWrapper >> setItem: anIPTMethod model: aModel parent: itemParent [

	self parent: itemParent.
	self setItem: anIPTMethod model: aModel
]
