Class {
	#name : #IPTClassListItemWrapper,
	#superclass : #PluggableListItemWrapper,
	#category : #InteractivePongTutorial
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:04'
}
IPTClassListItemWrapper >> asString [
	^ self item
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:19'
}
IPTClassListItemWrapper >> contents [
	^ {'a'.'b'.'c'} collect: [ :each | 
		IPTMethodListItemWrapper with: each model: self model parent: self]

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:17'
}
IPTClassListItemWrapper >> hasContents [
	^ true
]
