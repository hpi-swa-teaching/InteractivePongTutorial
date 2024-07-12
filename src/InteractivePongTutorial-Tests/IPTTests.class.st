Class {
	#name : #IPTTests,
	#superclass : #TestCase,
	#instVars : [
		'ipt'
	],
	#category : #'InteractivePongTutorial-Tests'
}

{
	#category : #running,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 08:55'
}
IPTTests >> setUp [

	ipt := IPT new.
]

{
	#category : #running,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 08:55'
}
IPTTests >> tearDown [

	ipt closeAllWindows.
	ipt := nil.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 09:14'
}
IPTTests >> testCloseAllWindows [
	
	ipt openChapterView.
	ipt openLevel: 1 inChapter: IPTMockInfos mockChapterSet second.
	ipt closeAllWindows.
	
	self assert: ipt chapterview isNil.
	self assert: ipt browser isNil.
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'sv 7/12/2024 18:53'
}
IPTTests >> testOpen [

	| instance |
	
	instance := IPT open.
	
	self assert: (instance isKindOf: IPT).
	self assert: (instance chapterview isKindOf: IPTChapterView).
	self assert: (SystemWindow allSubInstances anySatisfy: [ :window |
		window model == ipt chapterview ]).
	
	instance closeAllWindows.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'sv 7/12/2024 18:54'
}
IPTTests >> testOpenBrowser [

	ipt openLevel: 1 inChapter: IPTMockInfos mockChapterSet second.
	
	self assert: (ipt browser isKindOf: IPTBrowser).
	self assert: (SystemWindow allSubInstances anySatisfy: [ :window |
		window model == ipt browser ]).
]

{
	#category : #testing,
	#'squeak_changestamp' : 'sv 7/12/2024 18:54'
}
IPTTests >> testOpenChapterView [
	
	ipt openChapterView.
	
	self assert: (ipt chapterview isKindOf: IPTChapterView).
	self assert: (SystemWindow allSubInstances anySatisfy: [ :window |
		window model == ipt chapterview ]).
]
