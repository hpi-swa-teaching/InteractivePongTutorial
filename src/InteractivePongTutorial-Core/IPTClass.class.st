"
This class is a CodePiece but for class code.
"
Class {
	#name : #IPTClass,
	#superclass : #IPTCodePiece,
	#instVars : [
		'methodCodePieces'
	],
	#category : #'InteractivePongTutorial-Core',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 11:06'
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
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 12:17'
}
IPTClass class >> methodCodePiecesFor: aClass [

	| filePaths |
	filePaths := ((GitAssetLoader for: 'InteractivePongTutorial') loadString: '/assets/methodIndex.txt') lines asOrderedCollection.
	^ (filePaths 
		select: [:filePath | filePath includesSubstring: aClass asString])
		collect: [:filePath | IPTCodePiece fromFile: filePath].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:12'
}
IPTClass >> code [

	^ self referencedClass definition.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:12'
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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:13'
}
IPTClass >> loadInitialCodeForLevel: aLevelIndex andChapter: aChapterNumber [

	^self shouldNotImplement.
]

{
	#category : #behaviour,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:13'
}
IPTClass >> loadSolutionCodeForLevel: aLevelIndex andChapter: aChapterNumber [

	self shouldNotImplement.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:13'
}
IPTClass >> methodCodePieces [

	^ methodCodePieces.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:13'
}
IPTClass >> methodCodePieces: aCodePiece [

	methodCodePieces := aCodePiece.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:13'
}
IPTClass >> name [

	^ self referencedClass asString.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:13'
}
IPTClass >> referencedMethod [

	^ nil.
]
