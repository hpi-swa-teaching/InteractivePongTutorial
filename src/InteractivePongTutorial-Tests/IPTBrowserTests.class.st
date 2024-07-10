Class {
	#name : #IPTBrowserTests,
	#superclass : #TestCase,
	#instVars : [
		'browser',
		'ipt',
		'chapter',
		'initialLevelIndex'
	],
	#category : #'InteractivePongTutorial-Tests'
}

{
	#category : #running,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 15:06'
}
IPTBrowserTests >> setUp [

	super setUp.
	chapter := IPTChapter 
			withName: 'MockChapter'
			number: 1
			description: 'MockChapter'
			levels: {IPTMockLevel0101. IPTMockLevel0102}.
	initialLevelIndex := 2.
	ipt := IPT new.
	browser := IPTBrowser openFrom: ipt 
		chapter: chapter 
		levelIndex: initialLevelIndex
		classSet: IPTMockClass mockClassList.
	ipt browser: browser.
]

{
	#category : #running,
	#'squeak_changestamp' : 'sv 7/2/2024 16:24'
}
IPTBrowserTests >> tearDown [

	ipt closeAllWindows.
	
	browser := nil.
	ipt := nil.
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:56'
}
IPTBrowserTests >> testBuildCodeEditorWith [

	| spec |
	spec := browser buildCodeEditorWith: ToolBuilder new.
	
	self assert: (spec isKindOf: PluggableCodePaneSpec).
	self assert: browser codeEditor equals: spec model.
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:47'
}
IPTBrowserTests >> testBuildCodePieceListWith [

	| spec |
	spec := browser buildCodePieceListWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableTreeSpec).
	self assert: browser equals: spec model.
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 11:42'
}
IPTBrowserTests >> testBuildDescriptionBoxWith [

	| spec |
	spec := browser buildOutputBoxWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableTextSpec).
	self assert: browser equals: spec model.
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:48'
}
IPTBrowserTests >> testBuildHomeButtonWith [

	| spec |
	spec := browser buildHomeButtonWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableButtonSpec).
	self assert: browser equals: spec model.
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:49'
}
IPTBrowserTests >> testBuildNextLevelButtonWith [

	| spec |
	spec := browser buildNextLevelButtonWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableButtonSpec).
	self assert: browser equals: spec model.
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:49'
}
IPTBrowserTests >> testBuildPreviousLevelButtonWith [

	| spec |
	spec := browser buildPreviousLevelButtonWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableButtonSpec).
	self assert: browser equals: spec model.
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:50'
}
IPTBrowserTests >> testBuildResetButtonWith [

	| spec |
	spec := browser buildResetButtonWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableButtonSpec).
	self assert: browser equals: spec model.
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'Josua Zehner 7/6/2024 17:29'
}
IPTBrowserTests >> testBuildShowSolutionButtonWith [

	| spec |
	spec := browser buildLoadSolutionButtonWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableButtonSpec).
	self assert: browser equals: spec model.
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 17:51'
}
IPTBrowserTests >> testBuildTitleBarWith [

	| spec |
	spec := browser buildTitleBarWith: ToolBuilder new.
	
	self assert: true equals: (spec isKindOf: PluggableTextSpec).
	self assert: browser equals: spec model.
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 11:07'
}
IPTBrowserTests >> testBuildVerifyButtonWith [

	| spec |
	spec := browser buildPlayButtonWith: ToolBuilder new.
	
	self assert: (spec isKindOf: PluggableButtonSpec).
	self assert: browser equals: spec model.
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:30'
}
IPTBrowserTests >> testHomeButtonAction [

	ipt browser homeButtonAction.
	
	self assert: (ipt browser = nil).
	self assert: (ipt chapterview isKindOf: IPTChapterView).
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:22'
}
IPTBrowserTests >> testInitialState [

	self assert: browser chapter == chapter.
	self assert: browser activeLevel == (chapter levels at: initialLevelIndex).
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:22'
}
IPTBrowserTests >> testLoadLevel [

	browser loadLevel: chapter levels size.
	self assert: browser levelIndex == chapter levels size.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:29'
}
IPTBrowserTests >> testLoadSolutionButtonEnabled [
	
	browser selectCodePiece: nil.
	self assert: browser loadSolutionButtonEnabled == false.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:19'
}
IPTBrowserTests >> testNextLevelButton [

	browser loadLevel: 1.
	browser nextLevelButtonAction.
	self assert: browser levelIndex == 2.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:22'
}
IPTBrowserTests >> testNextLevelButtonEnabled [

	browser loadLevel: chapter levels size.
	self assert: browser nextLevelButtonEnabled == false.
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'sv 7/2/2024 16:28'
}
IPTBrowserTests >> testPlayground [

	| playground |
	
	playground := IPTPlayground new. 

	browser playground: playground.
	
	self assert: ((browser instVarNamed: 'playground') = playground).
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:19'
}
IPTBrowserTests >> testPreviousLevelButton [

	browser loadLevel: 2.
	browser previousLevelButtonAction.
	self assert: browser levelIndex == 1.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:22'
}
IPTBrowserTests >> testPreviousLevelButtonEnabled [

	browser loadLevel: 1.
	self assert: browser previousLevelButtonEnabled == false.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 15:14'
}
IPTBrowserTests >> testResetButtonAction [

	| codePiece |
	
	codePiece := ((browser visibleClassSet first) methodCodePieces first).
	
	browser selectCodePiece: codePiece.
	
	codePiece code: 'ÄÄÄÄ'.
	
	browser resetButtonAction.
	
	self assert:
		codePiece code =	(codePiece loadInitialCodeForLevel: browser levelIndex andChapter: chapter chapterNumber) code.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:29'
}
IPTBrowserTests >> testResetButtonEnabled [
	
	browser selectCodePiece: nil.
	self assert: browser resetButtonEnabled = false.
]

{
	#category : #'testing-builds',
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 13:42'
}
IPTBrowserTests >> testRunCode [
	
	browser runCode.
	
	self assert: (browser testResult at: #errors) isEmpty.
	self assert: (browser testResult at: #failures) isEmpty not.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:24'
}
IPTBrowserTests >> testSelectCodePiece [

	| codePiece |
	
	codePiece := (browser visibleClassSet at: 1) methodCodePieces at: 1.
	
	browser selectCodePiece: codePiece.
	
	self assert: (codePiece = (browser selectedCodePiece)).
	self assert: (codePiece = (browser codeEditor codePiece)).
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 15:25'
}
IPTBrowserTests >> testSolutionButtonAction [

	| codePiece |
	
	codePiece := ((browser visibleClassSet at: 1) methodCodePieces at: 1).
	
	browser selectCodePiece: codePiece.
	
	browser loadSolutionButtonAction.
	
	self assert:
		codePiece code =	(codePiece loadSolutionCodeForLevel: browser levelIndex andChapter: chapter chapterNumber) code.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:28'
}
IPTBrowserTests >> testSqueaky [

	self assert: (browser squeaky isKindOf: IPTSqueaky).
]
