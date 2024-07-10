Class {
	#name : #IPTMockInfos,
	#superclass : #Object,
	#category : #'InteractivePongTutorial-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 15:41'
}
IPTMockInfos class >> mockChapterSet [
	
	^ {IPTChapter 
			withName: 'MockChapter 0'
			number: 0
			description: 'MockChapter 0'
			levels: {}.
		IPTChapter 
			withName: 'MockChapter 1'
			number: 1
			description: 'MockChapter 1'
			levels: {IPTMockLevel0101. IPTMockLevel0102}.
		IPTChapter 
			withName: 'MockChapter 2'
			number: 2
			description: 'MockChapter 2'
			levels: {IPTMockLevel0201}
			}.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 15:10'
}
IPTMockInfos class >> mockClassList [

	^ {IPTClass new
		referencedClass: IPTMockGame;
		methodCodePieces: {IPTCodePiece fromFile: '/assets/IPTMockGame/mockMethod.txt'}}.
]
