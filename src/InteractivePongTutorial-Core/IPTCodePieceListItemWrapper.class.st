"
This class organizes the IPTCodePiece and IPTClass instances and displays them in a TreeView in the Browser.
"
Class {
	#name : #IPTCodePieceListItemWrapper,
	#superclass : #PluggableListItemWrapper,
	#instVars : [
		'parent'
	],
	#category : #'InteractivePongTutorial-Core',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 11:07'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:14'
}
IPTCodePieceListItemWrapper class >> with: aCodePiece model: aModel parent: aParent [

	^ self new 
		setItem: aCodePiece model: aModel parent: aParent.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:14'
}
IPTCodePieceListItemWrapper >> asString [

	^ self item name.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:14'
}
IPTCodePieceListItemWrapper >> contents [

	"Assuming self is an IPTClass object"
	^ item methodCodePieces collect: [ :each | 
		IPTCodePieceListItemWrapper with: each model: self model parent: self].

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:14'
}
IPTCodePieceListItemWrapper >> hasContents [

	^ item isClass.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:15'
}
IPTCodePieceListItemWrapper >> icon [

	(self item isClass or: [self item readOnly]) ifTrue: [^ nil].
	^ ToolIcons iconNamed: (self item isGreen
		ifTrue: [#testGreen]
		ifFalse: [#testRed]).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:15'
}
IPTCodePieceListItemWrapper >> parent [

	^ parent.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:15'
}
IPTCodePieceListItemWrapper >> parent: aParent [.

	parent := aParent.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:15'
}
IPTCodePieceListItemWrapper >> setItem: aCodePiece model: aModel parent: itemParent [

	self parent: itemParent.
	self setItem: aCodePiece model: aModel.
]
