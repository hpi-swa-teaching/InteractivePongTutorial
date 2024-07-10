Class {
	#name : #IPTChapterViewTests,
	#superclass : #TestCase,
	#instVars : [
		'chapterview',
		'ipt'
	],
	#category : #'InteractivePongTutorial-Tests'
}

{
	#category : #running,
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 09:21'
}
IPTChapterViewTests >> selectChapterTwoLevelOne [
	
	chapterview selectChapter: (IPTChapter chapterSet at: 2).
]

{
	#category : #running,
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 11:45'
}
IPTChapterViewTests >> setUp [

	super setUp.
	ipt := IPT new openChapterView.
	chapterview := ipt chapterview.
]

{
	#category : #running,
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 09:23'
}
IPTChapterViewTests >> tearDown [
	ipt closeAllWindows.
	chapterview := nil.
	ipt := nil.
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:13'
}
IPTChapterViewTests >> testBuildChapterDescriptionBoxWith [

	| spec |
	spec := chapterview buildChapterDescriptionBoxWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableTextSpec).
	self assert: chapterview equals: spec model.
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:25'
}
IPTChapterViewTests >> testBuildChapterListWith [

	| spec |
	spec := chapterview buildChapterListWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableListSpec).
	self assert: chapterview equals: spec model.
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 16:52'
}
IPTChapterViewTests >> testBuildColumnAreaSpecWith [

	| spec |
	
	spec := chapterview.
	"
	self assert: true equals: (spec isKindOf: ).
	self assert: board equals: spec model."
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:13'
}
IPTChapterViewTests >> testBuildLevelDescriptionBoxWith [

	| spec |
	spec := chapterview buildLevelDescriptionBoxWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableTextSpec).
	self assert: chapterview equals: spec model.
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:24'
}
IPTChapterViewTests >> testBuildLevelListWith [

	| spec |
	spec := chapterview buildLevelListWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableListSpec).
	self assert: chapterview equals: spec model.
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:32'
}
IPTChapterViewTests >> testBuildStartButtonWith [

	| spec |
	spec := chapterview buildStartButtonWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableButtonSpec).
	self assert: chapterview equals: spec model.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 09:21'
}
IPTChapterViewTests >> testCanStartLevel [

	self assert: chapterview canStartLevel == false.
	self selectChapterTwoLevelOne.
	self	 assert: chapterview canStartLevel == true.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:22'
}
IPTChapterViewTests >> testInitialState [

	self assert: chapterview selectedChapter chapterNumber equals: 0. 
	self assert: chapterview selectedLevel equals: nil.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:08'
}
IPTChapterViewTests >> testNoLevelSelected [

	chapterview selectLevel: nil.
	self assert: chapterview levelDescription == chapterview noLevelSelectedMessage.
]

{
	#category : #testing,
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
	#category : #testing,
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
	#category : #testing,
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 09:23'
}
IPTChapterViewTests >> testStartLevel [

	self selectChapterTwoLevelOne.
	chapterview startSelectedLevel.
	self assert: (ipt browser isKindOf: IPTBrowser).
	self assert: (ipt browser chapter == chapterview selectedChapter).
	self assert: (ipt browser levelIndex == 1).
]
