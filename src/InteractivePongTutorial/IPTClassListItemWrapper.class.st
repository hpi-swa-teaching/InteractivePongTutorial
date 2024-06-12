Class {
	#name : #IPTClassListItemWrapper,
	#superclass : #PluggableListItemWrapper,
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 11:55'
}
IPTClassListItemWrapper >> asString [
	^ self item name.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 11:55'
}
IPTClassListItemWrapper >> contents [
	^ item methodCodePieces collect: [ :each | 
		IPTMethodListItemWrapper with: each model: self model parent: self]

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:17'
}
IPTClassListItemWrapper >> hasContents [
	^ true
]
