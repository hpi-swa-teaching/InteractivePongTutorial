Class {
	#name : #IPTCodePieceListItemWrapper,
	#superclass : #PluggableListItemWrapper,
	#instVars : [
		'parent'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:24'
}
IPTCodePieceListItemWrapper class >> with: anIPTMethod model: aModel parent: aParent [

	^ self new 
		setItem: anIPTMethod model: aModel parent: aParent

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 11:56'
}
IPTCodePieceListItemWrapper >> asString [
	^ self item name.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:15'
}
IPTCodePieceListItemWrapper >> contents [
	"Assuming self is an IPTClass object"
	^ item methodCodePieces collect: [ :each | 
		IPTCodePieceListItemWrapper with: each model: self model parent: self]

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:12'
}
IPTCodePieceListItemWrapper >> hasContents [
	^ item isClass.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:25'
}
IPTCodePieceListItemWrapper >> parent [
	^ parent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:25'
}
IPTCodePieceListItemWrapper >> parent: anObject [
	parent := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:23'
}
IPTCodePieceListItemWrapper >> setItem: anIPTMethod model: aModel parent: itemParent [

	self parent: itemParent.
	self setItem: anIPTMethod model: aModel
]
