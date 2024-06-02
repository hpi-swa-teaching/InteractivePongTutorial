Class {
	#name : #IPTObject,
	#superclass : #Object,
	#instVars : [
		'codeEditor',
		'selectedMethod'
	],
	#category : #InteractivePongTutorial
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 13:43'
}
IPTObject >> methodToBeChanged [
	^ IPTObject >> #test
	
" | o me |
o := IPTObject new.

me := o methodToBeChanged methodClass.

me compile:  'test', Character cr, Character tab, '^ 42'."
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 13:39'
}
IPTObject >> test [
	^ 42
]
