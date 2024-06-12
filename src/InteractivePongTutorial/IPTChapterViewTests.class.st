Class {
	#name : #IPTChapterViewTests,
	#superclass : #TestCase,
	#instVars : [
		'chapterview',
		'ipt'
	],
	#category : #'InteractivePongTutorial-Core-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 14:11'
}
IPTChapterViewTests >> setUp [
	super setUp.
	chapterview := IPTChapterView new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 14:12'
}
IPTChapterViewTests >> tearDown [
	chapterview := nil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 14:01'
}
IPTChapterViewTests >> testInitialState [
	self assert: chapterview selectedChapter chapterNumber equals: 0. 
	self assert: chapterview selectedLevel equals: nil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 14:20'
}
IPTChapterViewTests >> testSelectChapter [
	|previousChapter |
	previousChapter := chapterview selectedChapter.
	chapterview selectChapter: (chapterview chapters at: 2).
	self assert: (chapterview selectedChapter == (chapterview chapters at: 2)).
	chapterview selectChapter: previousChapter.
	self assert: chapterview selectedChapter == previousChapter.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 14:21'
}
IPTChapterViewTests >> testSelectLevel [
	|previousLevel newLevel|
	chapterview selectedLevel ifNotNil: [
	previousLevel := chapterview selectedLevel.
	newLevel := chapterview selectedChapter levels at: chapterview selectedChapter levels size.
	chapterview selectLevel: newLevel.
	self assert: chapterview selectedLevel == newLevel.
	chapterview selectLevel: previousLevel.
	self assert: chapterview selectedChapter == previousLevel.]
]
