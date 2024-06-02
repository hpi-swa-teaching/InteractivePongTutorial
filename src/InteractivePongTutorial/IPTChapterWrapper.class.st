Class {
	#name : #IPTChapterWrapper,
	#superclass : #PluggableListItemWrapper,
	#category : #InteractivePongTutorial
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 14:07'
}
IPTChapterWrapper >> asString [
	^self item
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 13:58'
}
IPTChapterWrapper >> contents [
	^ self item ChapterLevel collect: [ :each | 
		IPTMethodListItemWrapper with: each model: self model parent: self]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 13:51'
}
IPTChapterWrapper >> hasContents [
	^ true
]
