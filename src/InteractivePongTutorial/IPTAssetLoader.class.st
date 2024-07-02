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
	#'squeak_changestamp' : 'FH 7/2/2024 10:45'
}
IPTAssetLoader class >> methodCodePiecesFor: aClassNameString [
	|methods filenames|
	filenames:= (((GitAssetLoader for: 'InteractivePongTutorial') loadString: IPTAssetLoader indexFilePath)splitBy: {Character cr}) asOrderedCollection.
	filenames removeAllSuchThat: [:el | el includesSubstring: aClassNameString].
	methods := OrderedCollection new.
	filenames do:[:el | methods add: (IPTCodePiece fromFile: el)].
	^methods.
]
