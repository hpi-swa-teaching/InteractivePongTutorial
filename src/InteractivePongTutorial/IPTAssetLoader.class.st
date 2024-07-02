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
	#'squeak_changestamp' : 'Josua Zehner 7/2/2024 17:03'
}
IPTAssetLoader class >> methodCodePiecesFor: aClassNameString [

	| filenames |
	filenames := ((GitAssetLoader for: 'InteractivePongTutorial') loadString: IPTAssetLoader indexFilePath) lines asOrderedCollection.
	filenames reject: [:filename | filename includesSubstring: aClassNameString].
	^ filenames collect: [:filename | IPTCodePiece fromFile: filename].
]
