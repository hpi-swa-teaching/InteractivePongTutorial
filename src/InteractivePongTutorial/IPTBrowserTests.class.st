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
	#category : #building,
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:56'
}
IPTBrowserTests >> testBuildCodeEditorWith [

	| spec |
	spec := browser buildCodeEditorWith: ToolBuilder new.
	
	self assert: (spec isKindOf: PluggableCodePaneSpec).
	self assert: browser codeEditor equals: spec model.
]

{
	#category : #building,
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:47'
}
IPTBrowserTests >> testBuildCodePieceListWith [

	| spec |
	spec := browser buildCodePieceListWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableTreeSpec).
	self assert: browser equals: spec model.
]

{
	#category : #building,
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 11:42'
}
IPTBrowserTests >> testBuildDescriptionBoxWith [

	| spec |
	spec := browser buildOutputBoxWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableTextSpec).
	self assert: browser equals: spec model.
]

{
	#category : #building,
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:48'
}
IPTBrowserTests >> testBuildHomeButtonWith [

	| spec |
	spec := browser buildHomeButtonWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableButtonSpec).
	self assert: browser equals: spec model.
]

{
	#category : #building,
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:49'
}
IPTBrowserTests >> testBuildNextLevelButtonWith [

	| spec |
	spec := browser buildNextLevelButtonWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableButtonSpec).
	self assert: browser equals: spec model.
]

{
	#category : #building,
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:49'
}
IPTBrowserTests >> testBuildPreviousLevelButtonWith [

	| spec |
	spec := browser buildPreviousLevelButtonWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableButtonSpec).
	self assert: browser equals: spec model.
]

{
	#category : #building,
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:50'
}
IPTBrowserTests >> testBuildResetButtonWith [

	| spec |
	spec := browser buildResetButtonWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableButtonSpec).
	self assert: browser equals: spec model.
]

{
	#category : #building,
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:51'
}
IPTBrowserTests >> testBuildShowSolutionButtonWith [

	| spec |
	spec := browser buildShowSolutionButtonWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableButtonSpec).
	self assert: browser equals: spec model.
]

{
	#category : #building,
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:51'
}
IPTBrowserTests >> testBuildTitleBarWith [

	| spec |
	spec := browser buildTitleBarWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableTextSpec).
	self assert: browser equals: spec model.
]

{
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 11:07'
}
IPTBrowserTests >> testBuildVerifyButtonWith [

	| spec |
	spec := browser buildPlayButtonWith: ToolBuilder new.
	
	self assert: (spec isKindOf: PluggableButtonSpec).
	self assert: browser equals: spec model.
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
