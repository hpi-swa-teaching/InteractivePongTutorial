Class {
	#name : #IPT,
	#superclass : #Object,
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 17:36'
}
IPT class >> defaultWindowColor [
	^ Color green lighter.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JZ 6/7/2024 13:15'
}
IPT class >> open [
	^ self new.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JZ 6/7/2024 16:08'
}
IPT >> initialize [
	TheWorldMenu registerOpenCommand: {'Interactive Pong Tutorial'. {self class. #open}}.
	self openChapterView.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'JZ 6/7/2024 13:28'
}
IPT >> openChapterView [
	IPTChapterView openFrom: self.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 17:59'
}
IPT >> openLevel: aNumber inChapter: aChapter [
	IPTBrowser openFrom: self chapter: aChapter levelIndex: aNumber.
]
