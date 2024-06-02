Class {
	#name : #IPTLevel,
	#superclass : #Object,
	#category : #InteractivePongTutorial
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 16:43'
}
IPTLevel class >> Chapter [
	^(self subclasses select: [:each | each ChapterLevel size > 0])
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 13:57'
}
IPTLevel class >> ChapterName [
	^self subclassResponsibility
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 17:03'
}
IPTLevel class >> LevelName [
	self subclassResponsibility
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 12:56'
}
IPTLevel class >> categoryName [
	^self ChapterName
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 14:02'
}
IPTLevel >> LevelDescription [
	^ self subclassResponsibility
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 17:05'
}
IPTLevel >> LevelName [
	self subclassResponsibility
]
