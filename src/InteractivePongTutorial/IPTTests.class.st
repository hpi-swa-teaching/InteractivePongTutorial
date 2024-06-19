Class {
	#name : #IPTTests,
	#superclass : #TestCase,
	#instVars : [
		'ipt'
	],
	#category : #'InteractivePongTutorial-Core-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 11:26'
}
IPTTests >> setUp [
	ipt := IPT new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 09:07'
}
IPTTests >> tearDown [
	ipt closeAllWindows.
	ipt := nil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 6/19/2024 11:28'
}
IPTTests >> testClassOpen [

	| altIPT |

	altIPT := IPT open.
	
	self assert: (altIPT isKindOf: IPT).
	self assert: (altIPT chapterview isNil not).
	self assert: (altIPT browser isNil).
	
	altIPT closeAllWindows.
	altIPT := nil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 09:12'
}
IPTTests >> testCloseAllWindows [
	ipt openChapterView.
	ipt openLevel: 1 inChapter: (IPTChapter chapterSet at: 2).
	ipt closeAllWindows.
	self assert: ipt chapterview isNil.
	self assert: ipt browser isNil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 09:14'
}
IPTTests >> testOpenBrowser [
	ipt openLevel: 1 inChapter: (IPTChapter chapterSet at: 2).
	self assert: (ipt browser isKindOf: IPTBrowser).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 09:10'
}
IPTTests >> testOpenChapterView [
	ipt openChapterView.
	self assert: (ipt chapterview isKindOf: IPTChapterView).
]
