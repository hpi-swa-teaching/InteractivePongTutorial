Class {
	#name : #IPTAssetLoader,
	#superclass : #Object,
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/2/2024 10:35'
}
IPTAssetLoader class >> indexFilePath [
	^'/assets/methodIndex.txt'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/2/2024 17:05'
}
IPTAssetLoader class >> methodCodePiecesFor: aClassNameString [

	| filePaths |
	filePaths := ((GitAssetLoader for: 'InteractivePongTutorial') loadString: IPTAssetLoader indexFilePath) lines asOrderedCollection.
	filePaths reject: [:filePath | filePath includesSubstring: aClassNameString].
	^ filePaths collect: [:filePath | IPTCodePiece fromFile: filePath].
]
