Class {
	#name : #IPTBrowser,
	#superclass : #Model,
	#instVars : [
		'ipt',
		'codeEditor',
		'selectedCodePiece',
		'chapter',
		'levelIndex',
		'classSet',
		'testResult',
		'explanationIndex',
		'visibleClassSet',
		'playground',
		'squeaky'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 13:57'
}
IPTBrowser class >> openFrom: anIPT chapter: aChapter levelIndex: aNumber [

	| browser |
	browser := self new 
		ipt: anIPT;
		chapter: aChapter;
		loadLevel: aNumber;
		yourself.
	ToolBuilder open: browser.
	browser changed: #expandRootsRequested.
	^ browser
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:05'
}
IPTBrowser >> activeLevel [
	^ self chapter levels at: self levelIndex
]

{
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 12:38'
}
IPTBrowser >> buildCodeEditorWith: aBuilder [

	^ (self codeEditor buildCodePaneWith: aBuilder)
		frame: (LayoutFrame new
			leftFraction: 0.25;
			topFraction: 0.5;
			rightFraction: 0.75;
			bottomFraction: 1)
]

{
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:22'
}
IPTBrowser >> buildCodePieceListWith: aBuilder [

	^ aBuilder pluggableTreeSpec new
		model: self;
		roots: #visibleClassSet;
		nodeClass: IPTCodePieceListItemWrapper;
		getSelected: #selectedCodePiece;
		setSelected: #selectCodePiece:;
		autoDeselect: true;
		frame: (LayoutFrame new
			leftFraction: 0;
			topFraction: (2 * self titleBarHeight);
			rightFraction: 0.25;
			bottomFraction: (1 - (2 * self buttonHeight))).
]

{
	#category : #building,
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 11:56'
}
IPTBrowser >> buildExplanationBoxWith: aBuilder [

	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #explanationBoxContent;
		readOnly: true;
		indicateUnacceptedChanges: false;
		frame: (LayoutFrame new
			leftFraction: 0.75;
			topFraction: 0.4;
			rightFraction: 1;
			bottomFraction: 0.8 - self titleBarHeight)
]

{
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:25'
}
IPTBrowser >> buildHomeButtonWith: aBuilder [

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: 'Home';
		action: #homeButtonAction;
		frame: (LayoutFrame new
			leftFraction: 0;
			topFraction: (1 - (2 * self buttonHeight));
			rightFraction: self buttonWidth;
			bottomFraction: (1 - self buttonHeight))
]

{
	#category : #building,
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 12:07'
}
IPTBrowser >> buildNextExplanationButtonWith: aBuilder [

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: '-->';
		enabled: #nextExplanationButtonEnabled;
		action: #nextExplanationButtonAction;
		frame: (LayoutFrame new
			leftFraction: 0.875;
			topFraction: 0.8 - self titleBarHeight;
			rightFraction: 1;
			bottomFraction: 0.8).
]

{
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:43'
}
IPTBrowser >> buildNextLevelButtonWith: aBuilder [

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: '-->';
		enabled: #nextLevelButtonEnabled;
		action: #nextLevelButtonAction;
		frame: (LayoutFrame new
			leftFraction: 0.125;
			topFraction: self titleBarHeight;
			rightFraction: 0.25;
			bottomFraction: (2 * self titleBarHeight))
]

{
	#category : #building,
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 12:14'
}
IPTBrowser >> buildOutputBoxWith: aBuilder [

	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #outputBoxContent;
		readOnly: true;
		indicateUnacceptedChanges: false;
		frame: (LayoutFrame new
			leftFraction: 0.75;
			topFraction: 0;
			rightFraction: 1;
			bottomFraction: 0.4)
]

{
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 11:07'
}
IPTBrowser >> buildPlayButtonWith: aBuilder [

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: 'Play';
		action: #runCode;
		enabled: true;
		frame: (LayoutFrame new
			leftFraction: 0;
			topFraction: (1 - self buttonHeight);
			rightFraction: 0.25 / 2;
			bottomFraction: 1)
]

{
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 10:00'
}
IPTBrowser >> buildPlaygroundWith: aBuilder [

	^ aBuilder pluggablePanelSpec new
		model: self;
		children: #playgroundInCollection;
		frame: (LayoutFrame new
			leftFraction: 0.25;
			topFraction: 0;
			rightFraction: 0.75;
			bottomFraction: 0.5)
]

{
	#category : #building,
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 11:59'
}
IPTBrowser >> buildPreviousExplanationButtonWith: aBuilder [

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: '<--';
		enabled: #previousExplanationButtonEnabled;
		action: #previousExplanationButtonAction;
		frame: (LayoutFrame new
			leftFraction: 0.75;
			topFraction: 0.8 - self titleBarHeight;
			rightFraction: 1 - 0.125;
			bottomFraction: 0.8).
]

{
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:43'
}
IPTBrowser >> buildPreviousLevelButtonWith: aBuilder [

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: '<--';
		enabled: #previousLevelButtonEnabled;
		action: #previousLevelButtonAction;
		frame: (LayoutFrame new
			leftFraction: 0;
			topFraction: self titleBarHeight;
			rightFraction: 0.125;
			bottomFraction: (2 * self titleBarHeight))
]

{
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 16:00'
}
IPTBrowser >> buildResetButtonWith: aBuilder [

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: 'Reset';
		action: #resetButtonAction;
		enabled: #resetButtonEnabled;
		frame: (LayoutFrame new
			leftFraction: 0.25 / 2;
			topFraction: (1 - self buttonHeight);
			rightFraction: 0.25;
			bottomFraction: 1)
]

{
	#category : #building,
	#'squeak_changestamp' : 'FH 6/15/2024 11:24'
}
IPTBrowser >> buildShowSolutionButtonWith: aBuilder [

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: 'Show Solution';
		action: #showSolutionButtonAction;
		enabled: #showSolutionButtonEnabled;
		frame: (LayoutFrame new
			leftFraction: self buttonWidth;
			topFraction: (1 - (2 * self buttonHeight));
			rightFraction: self buttonWidth * 2;
			bottomFraction: (1 - self buttonHeight))
]

{
	#category : #building,
	#'squeak_changestamp' : 'Josua Zehner 6/30/2024 18:52'
}
IPTBrowser >> buildSqueakyPanelWith: aBuilder [

	^ aBuilder pluggablePanelSpec new
		model: self;
		children: #squeakyInCollection;
		frame: (LayoutFrame new
			leftFraction: 0.75;
			topFraction: 0.8;
			rightFraction: 1;
			bottomFraction: 1)
]

{
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:26'
}
IPTBrowser >> buildTitleBarWith: aBuilder [

	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #titleBarContent;
		readOnly: true;
		indicateUnacceptedChanges: false;
		frame: (LayoutFrame new
			leftFraction: 0;
			topFraction: 0;
			rightFraction: 0.25;
			bottomFraction: self titleBarHeight)
]

{
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 13:56'
}
IPTBrowser >> buildWith: aBuilder [
	^ aBuilder build: (aBuilder pluggableWindowSpec new
		model: self;
		label: 'Interactive Pong Tutorial: ', self chapter name;
		extent: (1400@800);
		children: {
			self buildCodeEditorWith: aBuilder.
			self buildCodePieceListWith: aBuilder.
			self buildExplanationBoxWith: aBuilder.
			self buildHomeButtonWith: aBuilder.
			self buildNextExplanationButtonWith: aBuilder.
			self buildNextLevelButtonWith: aBuilder.
			self buildOutputBoxWith: aBuilder.
			self buildPlayButtonWith: aBuilder.
			self buildPlaygroundWith: aBuilder.
			self buildPreviousExplanationButtonWith: aBuilder.
			self buildPreviousLevelButtonWith: aBuilder.
			self buildResetButtonWith: aBuilder.			
			self buildShowSolutionButtonWith: aBuilder.
			self buildSqueakyPanelWith: aBuilder.
			self buildTitleBarWith: aBuilder. };
		yourself)
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:22'
}
IPTBrowser >> buttonHeight [
	^ 0.08
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:22'
}
IPTBrowser >> buttonWidth [
	^ 0.125
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 6/7/2024 15:46'
}
IPTBrowser >> chapter [
	^ chapter
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 6/7/2024 15:46'
}
IPTBrowser >> chapter: anObject [
	chapter := anObject
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:19'
}
IPTBrowser >> checkAndSaveCode [
	| code errMsg |
	self closeAllAutoCompletionMorphs.
	
	code := self codeEditor
		"accept;"
		code.
	errMsg := self selectedCodePiece checkSyntaxAndSaveCode: code.
	
	(errMsg = '')
		ifFalse: [ UIManager default inform: errMsg ].	
	"self playground clear."
	"self selectedLecture checkCode: code on: self playground."
	
	"self changed: #categoryList"

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/18/2024 17:50'
}
IPTBrowser >> classSet [
	classSet ifNil: [self classSet: IPTClass classList].
	^ classSet
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 14:08'
}
IPTBrowser >> classSet: anObject [
	classSet := anObject
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 19:52'
}
IPTBrowser >> close [
	self changed: #close.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 11:56'
}
IPTBrowser >> closeAllAutoCompletionMorphs [

	(Project currentWorld submorphs
		select: [:morph | morph isKindOf: OMenuMorph])
		do: [:morph | morph abandon]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 12:17'
}
IPTBrowser >> codeEditor [

	codeEditor ifNil: [self codeEditor: ((IPTEditor openOnBrowser: self) actionOnSave: [self checkAndSaveCode])].
	^ codeEditor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 12:35'
}
IPTBrowser >> codeEditor: anObject [
	codeEditor := anObject
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 12:38'
}
IPTBrowser >> explanationBoxContent [
	
	^ self activeLevel explanations at: self explanationIndex.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 11:48'
}
IPTBrowser >> explanationIndex [
	^ explanationIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 11:48'
}
IPTBrowser >> explanationIndex: anObject [
	explanationIndex := anObject
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 09:06'
}
IPTBrowser >> homeButtonAction [
	self ipt openChapterView.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 6/7/2024 13:30'
}
IPTBrowser >> ipt [
	^ ipt
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 6/7/2024 13:30'
}
IPTBrowser >> ipt: anObject [
	ipt := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:02'
}
IPTBrowser >> levelIndex [
	^ levelIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:02'
}
IPTBrowser >> levelIndex: anObject [
	levelIndex := anObject
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Josua Zehner 7/2/2024 16:57'
}
IPTBrowser >> loadLevel: aLevelIndex [
	self 
		levelIndex: aLevelIndex;
		explanationIndex: 1;
		selectCodePiece: nil.

	"load the solutionCode for all invisible/readOnly CodePieces;
		load the initialCode for all visible CodePieces without readonly"
	self classSet do: [ :c | 
		c methodCodePieces do: [ :codePiece | 
			codePiece 
				readOnly: false;
				isGreen: false;
				loadInitialCodeForLevel: self levelIndex andChapter: self chapter chapterNumber.]].
	
	self updateVisibleClassSetToMethods: self activeLevel visibleMethods.
	self playground ifNotNil: [
		self playground removeAllMorphs.].
	
	self squeaky mood: #neutral.
	self 
		update;
		"expand the CodePiece tree view"
		changed: #expandRootsRequested.
	
		
	
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 12:07'
}
IPTBrowser >> nextExplanationButtonAction [

	self explanationIndex: self explanationIndex +1.
	self update.
	
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 12:10'
}
IPTBrowser >> nextExplanationButtonEnabled [
	^ self activeLevel explanations size > self explanationIndex.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:47'
}
IPTBrowser >> nextLevelButtonAction [
	self loadLevel: (self levelIndex + 1).
	
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:42'
}
IPTBrowser >> nextLevelButtonEnabled [
	^ self chapter levels size > self levelIndex.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 20:42'
}
IPTBrowser >> outputBoxContent [
	| output |
	output := ''.
	self testResult ifNotNil: [
	output := ((self testResult at: #errors) inject: 'Errors:' into: [:run :err |
		 run, Character cr, (IPTLevel resultEntryToString: err) ]), Character cr, Character cr.
	output := ((self testResult at: #failures) inject: (output, 'Failures:') into: [:run :err |
		 run, Character cr, (IPTLevel resultEntryToString: err) ]).
	
	(self testResult at: #success) ifTrue: [
			output := 'Well done! :)']].

	^ output.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 6/30/2024 18:16'
}
IPTBrowser >> playground [
	playground ifNil: [playground := IPTPlayground new].
	^ playground
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/18/2024 16:47'
}
IPTBrowser >> playground: anObject [
	playground := anObject
]

{
	#category : #building,
	#'squeak_changestamp' : 'Josua Zehner 6/30/2024 18:54'
}
IPTBrowser >> playgroundInCollection [

	^ {self playground}.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 12:07'
}
IPTBrowser >> previousExplanationButtonAction [

	self explanationIndex: self explanationIndex - 1.
	self update.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 12:34'
}
IPTBrowser >> previousExplanationButtonEnabled [
	^ self explanationIndex > 1.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:44'
}
IPTBrowser >> previousLevelButtonAction [
	self loadLevel: (self levelIndex - 1).
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:42'
}
IPTBrowser >> previousLevelButtonEnabled [
	^ self levelIndex > 1.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 15:10'
}
IPTBrowser >> resetButtonAction [
	self levelIndex ifNotNil: [
		self selectedCodePiece loadInitialCodeForLevel: self levelIndex andChapter: self chapter chapterNumber.
		self codeEditor activeCodePiece: self selectedCodePiece.
	].
	
	
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 16:00'
}
IPTBrowser >> resetButtonEnabled [

	^ self selectedCodePiece isNil not
		and: [self selectedCodePiece isClass not]
		and: [self selectedCodePiece readOnly not].
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 21:29'
}
IPTBrowser >> runCode [
	
	| errors failures |
	
	 self testResult: self activeLevel runTests.
	 failures := self testResult at: #failures.
	 errors := self testResult at: #errors.
	
	(errors isEmpty and: [failures isEmpty])
		ifTrue: [self playground runCode.].
		
	self 
		updateSqueaky;
		updateCodePieceTestIndicators;
		update.

]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:22'
}
IPTBrowser >> selectCodePiece: aCodePiece [
	self selectedCodePiece: aCodePiece.
	
	self codeEditor activeCodePiece: aCodePiece.
	
	self update.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:18'
}
IPTBrowser >> selectedCodePiece [
	^ selectedCodePiece
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:18'
}
IPTBrowser >> selectedCodePiece: anObject [
	selectedCodePiece := anObject
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 14:20'
}
IPTBrowser >> showSolutionButtonAction [
	self levelIndex ifNotNil: [
		self selectedCodePiece loadSolutionCodeForLevel: self levelIndex andChapter: self chapter chapterNumber.
		self codeEditor activeCodePiece: self selectedCodePiece.
	].
	
	
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 16:00'
}
IPTBrowser >> showSolutionButtonEnabled [

	^ self selectedCodePiece isNil not
		and: [self selectedCodePiece isClass not]
		and: [self selectedCodePiece readOnly not].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 6/30/2024 18:16'
}
IPTBrowser >> squeaky [
	squeaky ifNil: [squeaky := IPTSqueaky new].
	^ squeaky
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 6/30/2024 18:11'
}
IPTBrowser >> squeaky: anObject [
	squeaky := anObject
]

{
	#category : #building,
	#'squeak_changestamp' : 'Josua Zehner 6/30/2024 18:53'
}
IPTBrowser >> squeakyInCollection [

	^ {self squeaky}.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 13:47'
}
IPTBrowser >> testResult [
	^ testResult
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 13:47'
}
IPTBrowser >> testResult: anObject [
	testResult := anObject
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 11:49'
}
IPTBrowser >> titleBarContent [
	^ self activeLevel asString.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 12:12'
}
IPTBrowser >> titleBarHeight [
	^ 0.05
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 16:00'
}
IPTBrowser >> update [
	self 
		changed: #levelIndex;
		changed: #titleBarContent;
		changed: #outputBoxContent;
		changed: #nextLevelButtonEnabled;
		changed: #previousLevelButtonEnabled;
		changed: #showSolutionButtonEnabled;
		changed: #resetButtonEnabled;
		changed: #visibleClassSet;
		changed: #explanationBoxContent;
		changed: #previousExplanationButtonEnabled;
		changed: #nextExplanationButtonEnabled;
		changed: #squeakyInCollection.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 21:39'
}
IPTBrowser >> updateCodePieceTestIndicators [

	| errors failures |
	errors := self testResult at: #errors.
	failures := self testResult at: #failures.
	
	self visibleClassSet do: [ :c |
		(c methodCodePieces
			reject: [ :codePiece | 
				errors, failures anySatisfy: [ :entry |
					 codePiece isSameSourceAs: (entry at: #method)]]) 
			do: [ :codePiece | 
				codePiece isGreen: true. ]].
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Josua Zehner 6/30/2024 18:34'
}
IPTBrowser >> updateSqueaky [

	| errors failures |
	errors := self testResult at: #errors.
	failures := self testResult at: #failures.
	
	(errors isEmpty and: [failures isEmpty]) 
		ifTrue: [self squeaky mood: #happy]
		ifFalse: [self squeaky mood: #sad]
	
	
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 22:03'
}
IPTBrowser >> updateVisibleClassSetToMethods: aMethodsCollection [	
	aMethodsCollection ifNil: [ ^nil.].
	self visibleClassSet: ((self classSet collect: [:c | c copy. ]) asOrderedCollection).
	
	"update readOnly for each visible codePiece"
	self visibleClassSet removeAllSuchThat: [:c |
		c methodCodePieces removeAllSuchThat: [:codePiece | |ms|
			ms := aMethodsCollection detect: [ :methodSelector | 
				codePiece isSameSourceAs: methodSelector method] ifNone: [].
			ms 
				ifNotNil: [codePiece readOnly: ms readOnly. false]
				ifNil: [true]].
		c methodCodePieces isEmpty].
	
	"Show all classes with methods that are in 'activeLevel visibleMethods'. If there are no methods in a class, dont show it"
	"self visibleClassSet removeAllSuchThat: [ :klass | 
		klass methodCodePieces removeAllSuchThat: [ :codePiece | 
			(aMethodsCollection anySatisfy: [ :methodSelector | 
				codePiece isSameSourceAs: methodSelector method]) not].
		klass methodCodePieces isEmpty. ]."
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/15/2024 11:57'
}
IPTBrowser >> visibleClassSet [
	^ visibleClassSet
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/15/2024 11:57'
}
IPTBrowser >> visibleClassSet: anObject [
	visibleClassSet := anObject
]
