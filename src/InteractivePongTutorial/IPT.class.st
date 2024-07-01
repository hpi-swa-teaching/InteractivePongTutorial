Class {
	#name : #IPT,
	#superclass : #Object,
	#instVars : [
		'browser',
		'chapterview'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 20:33'
}
IPT class >> compiledMethodToString: aCompiledMethod [
	^ aCompiledMethod asString copyFrom: 2 to: (aCompiledMethod asString indexOf: Character space) - 1.
]

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
	#category : #accessing,
	#'squeak_changestamp' : 'FH 6/19/2024 14:29'
}
IPT >> browser [
	^ browser.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 6/19/2024 14:29'
}
IPT >> browser: aBrowser [
	browser := aBrowser.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 6/19/2024 14:30'
}
IPT >> chapterview [
	^ chapterview.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 6/19/2024 14:30'
}
IPT >> chapterview: aChapterview [
	chapterview := aChapterview.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 09:14'
}
IPT >> closeAllWindows [
	self browser ifNotNil: [
		self browser close.
		self browser: nil].
	self chapterview ifNotNil: [
		self chapterview close.
		self chapterview: nil].
	
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
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 09:05'
}
IPT >> openChapterView [
	self closeAllWindows.
	self chapterview: (IPTChapterView openFrom: self).
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 09:05'
}
IPT >> openLevel: aNumber inChapter: aChapter [
	self closeAllWindows.
	self browser: (IPTBrowser openFrom: self chapter: aChapter levelIndex: aNumber).
]
