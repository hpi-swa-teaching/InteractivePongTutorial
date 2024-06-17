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
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:22'
}
IPTChapterViewTests >> setUp [

	super setUp.
	ipt := IPT new.
	chapterview := IPTChapterView openFrom: ipt.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:22'
}
IPTChapterViewTests >> tearDown [

	chapterview close.
	chapterview := nil.
	ipt := nil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:22'
}
IPTChapterViewTests >> testCanStartLevel [

	self assert: chapterview canStartLevel == chapterview selectedLevel isNil not.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:22'
}
IPTChapterViewTests >> testInitialState [

	self assert: chapterview selectedChapter chapterNumber equals: 0. 
	self assert: chapterview selectedLevel equals: nil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:08'
}
IPTChapterViewTests >> testNoLevelSelected [

	chapterview selectLevel: nil.
	self assert: chapterview levelDescription == chapterview noLevelSelectedMessage.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:23'
}
IPTChapterViewTests >> testSelectChapter [

	| previousChapter |
	previousChapter := chapterview selectedChapter.
	chapterview selectChapter: (chapterview chapters at: 2).
	self assert: (chapterview selectedChapter == (chapterview chapters at: 2)).
	chapterview selectChapter: previousChapter.
	self assert: chapterview selectedChapter == previousChapter.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:23'
}
IPTChapterViewTests >> testSelectLevel [

	| previousLevel newLevel |
	chapterview selectedLevel ifNotNil: [
		previousLevel := chapterview selectedLevel.
		newLevel := chapterview selectedChapter levels at: chapterview selectedChapter levels size.
		
		chapterview selectLevel: newLevel.
		
		self assert: chapterview selectedLevel == newLevel.
		self assert: chapterview levelDescription == newLevel description.
		
		chapterview selectLevel: previousLevel.
		
		self assert: chapterview selectedChapter == previousLevel.
		self assert: chapterview levelDescription == previousLevel description.
		
		chapterview selectLevel: nil.
		chapterview levelDescription == chapterview noLevelSelectedMessage.
	]
]
