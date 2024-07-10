Class {
	#name : #IPTMockClass,
	#superclass : #Object,
	#category : #'InteractivePongTutorial-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 15:10'
}
IPTMockClass class >> mockClassList [

	^ {IPTClass new
		referencedClass: IPTMockGame;
		methodCodePieces: {IPTCodePiece fromFile: '/assets/IPTMockGame/mockMethod.txt'}}.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 15:07'
}
IPTMockClass >> mockMethod [
	
]
