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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:11'
}
IPT class >> open [

	^ self new openChapterView.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:09'
}
IPT >> browser [

	^ browser.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:10'
}
IPT >> browser: aBrowser [

	browser := aBrowser.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:10'
}
IPT >> chapterview [

	^ chapterview.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:10'
}
IPT >> chapterview: aChapterview [

	chapterview := aChapterview.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:10'
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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:10'
}
IPT >> initialize [

	TheWorldMenu registerOpenCommand: {'Interactive Pong Tutorial'. {self class. #open}}.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:11'
}
IPT >> openChapterView [

	self closeAllWindows.
	self chapterview: (IPTChapterView openFrom: self).
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:11'
}
IPT >> openLevel: aNumber inChapter: aChapter [

	self closeAllWindows.
	self browser: (IPTBrowser openFrom: self chapter: aChapter levelIndex: aNumber).
]
