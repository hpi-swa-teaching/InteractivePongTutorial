Class {
	#name : #IPTChapterWrapper,
	#superclass : #PluggableListItemWrapper,
	#category : #InteractivePongTutorial
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 16:50'
}
IPTChapterWrapper >> asString [
	^self item ChapterName
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 17:11'
}
IPTChapterWrapper >> contents [
	^ self item ChapterLevel collect: [ :each | 
		IPTLevelWrapper with: each model: self model parent: self]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 13:51'
}
IPTChapterWrapper >> hasContents [
	^ true
]
