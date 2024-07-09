Class {
	#name : #IPTClass,
	#superclass : #IPTCodePiece,
	#instVars : [
		'methodCodePieces'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:19'
}
IPTClass class >> classList [

	^ {IPTGame. IPTBall. IPTPlayer} collect: [:classSelector | 
		IPTClass new
			referencedClass: classSelector;
			methodCodePieces: (self methodCodePiecesFor: classSelector).].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:20'
}
IPTClass class >> methodCodePiecesFor: aClass [

	| filePaths |
	filePaths := ((GitAssetLoader for: 'InteractivePongTutorial') loadString: '/assets/methodIndex.txt') lines asOrderedCollection.
	^ (filePaths select: [:filePath | (filePath includesSubstring: aClass asString)])
				collect: [:filePath | IPTCodePiece fromFile: filePath].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/3/2024 19:56'
}
IPTClass >> code [
	^ self referencedClass definition.
]

{
	#category : #behaviour,
	#'squeak_changestamp' : 'Felix Knöfel 6/24/2024 11:58'
}
IPTClass >> copy [
	^ super copy 
		methodCodePieces: (self methodCodePieces copy);
		yourself.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/3/2024 11:46'
}
IPTClass >> initialize [
	self readOnly: true.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:26'
}
IPTClass >> isSameSourceAs: aCompiledMethod [

	^ false.
]

{
	#category : #behaviour,
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 14:54'
}
IPTClass >> loadInitialCodeForLevel: aLevelIndex andChapter: aChapterNumber [
	^self shouldNotImplement.
]

{
	#category : #behaviour,
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 14:54'
}
IPTClass >> loadSolutionCodeForLevel: aLevelIndex andChapter: aChapterNumber [
	self shouldNotImplement.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 11:47'
}
IPTClass >> methodCodePieces [
	^ methodCodePieces
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 14:50'
}
IPTClass >> methodCodePieces: anObject [
	methodCodePieces := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/3/2024 19:51'
}
IPTClass >> name [
	^ self referencedClass asString.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/3/2024 19:52'
}
IPTClass >> referencedMethod [
	^ nil.
]
