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
	#'squeak_changestamp' : 'sv 7/2/2024 16:23'
}
IPTBrowserTests >> setUp [

	super setUp.
	chapter := IPTChapter chapterSet at: 2.
	initialLevelIndex := 2.
	ipt := IPT new.
	browser := IPTBrowser openFrom: ipt chapter: chapter levelIndex: initialLevelIndex.
	ipt browser: browser.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 7/2/2024 16:24'
}
IPTBrowserTests >> tearDown [

	ipt closeAllWindows.
	
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
	#'squeak_changestamp' : 'Josua Zehner 7/6/2024 17:29'
}
IPTBrowserTests >> testBuildShowSolutionButtonWith [

	| spec |
	spec := browser buildLoadSolutionButtonWith: ToolBuilder new.
	
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
	#category : #building,
	#'squeak_changestamp' : 'sv 7/2/2024 16:23'
}
IPTBrowserTests >> testHomeButtonAction [
	ipt browser homeButtonAction.
	
	self assert: (ipt browser = nil).
	self assert: (ipt chapterview isKindOf: IPTChapterView).
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
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 21:16'
}
IPTBrowserTests >> testNextLevelButton [

	browser nextLevelButtonEnabled ifTrue: [
	browser nextLevelButtonAction.
	self assert: browser levelIndex == (initialLevelIndex + 1).]
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
	#category : #building,
	#'squeak_changestamp' : 'sv 7/2/2024 16:28'
}
IPTBrowserTests >> testPlayground [

	| playground |
	
	playground := IPTPlayground new. 

	browser playground: playground.
	
	self assert: ((browser instVarNamed: 'playground') = playground).
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
	#'squeak_changestamp' : 'sv 7/2/2024 20:16'
}
IPTBrowserTests >> testResetButtonAction [

	| cp |
	
	cp := ((browser visibleClassSet at: 1) methodCodePieces at: 1).
	
	browser selectCodePiece: cp.
	
	cp code: 'ÄÄÄÄ'.
	
	browser resetButtonAction.
	
	self assert:
		(cp code =
			(cp addHeadToCode:
				((cp variantForLevel: initialLevelIndex fromChapter: chapter chapterNumber)
					initialCode))).
]

{
	#category : #building,
	#'squeak_changestamp' : 'sv 7/3/2024 09:47'
}
IPTBrowserTests >> testRunCode [

	browser chapter levels: {IPTMockLevel}.
	
	browser loadLevel: 1.
	
	browser runCode.
	
	self assert: (browser testResult at: #errors) isEmpty not.
	self assert: (browser testResult at: #failures) isEmpty.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 19:38'
}
IPTBrowserTests >> testSelectClass [
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 7/2/2024 20:24'
}
IPTBrowserTests >> testSelectMethod [

	| cp |
	
	cp := (browser visibleClassSet at: 1) methodCodePieces at: 1.
	
	browser selectCodePiece: cp.
	
	self assert: (cp = (browser instVarNamed: 'selectedCodePiece')).
	self assert: (cp = (browser codeEditor instVarNamed: 'activeCodePiece')).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/6/2024 17:29'
}
IPTBrowserTests >> testSolutionButtonAction [

	| cp |
	
	cp := ((browser visibleClassSet at: 1) methodCodePieces at: 1).
	
	browser selectCodePiece: cp.
	
	browser loadSolutionButtonAction.
	
	self assert:
		(cp code =
			(cp addHeadToCode:
				((cp variantForLevel: initialLevelIndex fromChapter: chapter chapterNumber)
					solutionCode))).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 7/2/2024 20:22'
}
IPTBrowserTests >> testSqueaky [

	| squeaky |

	squeaky := IPTSqueaky new.

	browser squeaky: squeaky.
	
	self assert: (squeaky = (browser instVarNamed: 'squeaky')).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/6/2024 17:30'
}
IPTBrowserTests >> testshowSolutionButtonEnabled [
	
	browser selectCodePiece: nil.
	self assert: browser loadSolutionButtonEnabled == false.
]
