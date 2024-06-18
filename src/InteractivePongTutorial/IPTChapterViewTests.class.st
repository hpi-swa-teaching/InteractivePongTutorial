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
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 09:21'
}
IPTChapterViewTests >> selectChapterTwoLevelOne [
	
	chapterview selectChapter: (IPTChapter chapterSet at: 2).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 11:45'
}
IPTChapterViewTests >> setUp [

	super setUp.
	ipt := IPT new openChapterView.
	chapterview := ipt chapterview.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 09:23'
}
IPTChapterViewTests >> tearDown [
	ipt closeAllWindows.
	chapterview := nil.
	ipt := nil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 09:21'
}
IPTChapterViewTests >> testCanStartLevel [

	self assert: chapterview canStartLevel == false.
	self selectChapterTwoLevelOne.
	self	 assert: chapterview canStartLevel == true.
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

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 09:23'
}
IPTChapterViewTests >> testStartLevel [

	self selectChapterTwoLevelOne.
	chapterview startSelectedLevel.
	self assert: (ipt browser isKindOf: IPTBrowser).
	self assert: (ipt browser chapter == chapterview selectedChapter).
	self assert: (ipt browser levelIndex == 1).
]
