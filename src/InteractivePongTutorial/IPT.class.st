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
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 19:41'
}
IPT class >> open [
	^ self new openChapterView.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 19:42'
}
IPT >> initialize [
	TheWorldMenu registerOpenCommand: {'Interactive Pong Tutorial'. {self class. #open}}.
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
