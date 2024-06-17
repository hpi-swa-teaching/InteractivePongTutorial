Class {
	#name : #IPTBrowserTests,
	#superclass : #TestCase,
	#instVars : [
		'browser',
		'ipt',
		'chapter',
		'initialLevelIndex'
	],
	#category : #'InteractivePongTutorial-Core-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:22'
}
IPTBrowserTests >> setUp [

	super setUp.
	chapter := IPTChapter chapterSet at: 2.
	initialLevelIndex := 2.
	ipt := IPT new.
	browser := IPTBrowser openFrom: ipt chapter:  chapter levelIndex: initialLevelIndex.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:22'
}
IPTBrowserTests >> tearDown [

	browser close.
	browser := nil.
	ipt := nil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:22'
}
IPTBrowserTests >> testInitialState [

	self assert: browser chapter == chapter.
	self assert: browser activeLevel == (chapter levels at: initialLevelIndex).
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:22'
}
IPTBrowserTests >> testLoadLevel [

	browser loadLevel: chapter levels size.
	self assert: browser levelIndex == chapter levels size.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:22'
}
IPTBrowserTests >> testNextLevelButton [

	browser nextLevelButtonEnabled ifTrue: [
	browser nextLevelButtonAction.
	self assert: browser levelIndex == initialLevelIndex + 1.]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:22'
}
IPTBrowserTests >> testNextLevelButtonEnabled [

	browser loadLevel: chapter levels size.
	self assert: browser nextLevelButtonEnabled == false.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:22'
}
IPTBrowserTests >> testPreviousLevelButton [

	(chapter levels size > 1) ifTrue: [
	browser loadLevel: chapter levels size.
	browser previousLevelButtonAction.
	self assert: browser levelIndex == (chapter levels size - 1).]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:22'
}
IPTBrowserTests >> testPreviousLevelButtonEnabled [

	browser loadLevel: 1.
	self assert: browser previousLevelButtonEnabled == false.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 19:38'
}
IPTBrowserTests >> testSelectClass [
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 19:38'
}
IPTBrowserTests >> testSelectMethod [
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:22'
}
IPTBrowserTests >> testshowSolutionButtonEnabled [
	
	browser selectMethod: nil.
	self assert: browser showSolutionButtonEnabled == false.
]
