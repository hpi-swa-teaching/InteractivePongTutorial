"
This class is responsible for displaying the Methods, Content of the Levels and most UI elements. It also connects CodePieces, editor and the playground
"
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
	#category : #'InteractivePongTutorial-Core',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 10:38'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:52'
}
IPTBrowser class >> openFrom: anIPT chapter: aChapter levelIndex: aNumber classSet: anIPTClassCollection [

	| browser |
	browser := self new 
		ipt: anIPT;
		chapter: aChapter;
		classSet: anIPTClassCollection;
		loadLevel: aNumber.
	ToolBuilder open: browser.
	browser changed: #expandRootsRequested.
	^ browser.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:24'
}
IPTBrowser >> activeLevel [

	^ self chapter levels at: self levelIndex.
]

{
	#category : #building,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:24'
}
IPTBrowser >> buildCodeEditorWith: aBuilder [

	^ (self codeEditor buildCodePaneWith: aBuilder)
		frame: (LayoutFrame new
			leftFraction: 0.25;
			topFraction: 0.5;
			rightFraction: 0.75;
			bottomFraction: 1).
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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:25'
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
			bottomFraction: 0.8 - self titleBarHeight).
]

{
	#category : #building,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:25'
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
			bottomFraction: (1 - self buttonHeight)).
]

{
	#category : #building,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:25'
}
IPTBrowser >> buildLoadSolutionButtonWith: aBuilder [

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: 'Load Solution';
		action: #loadSolutionButtonAction;
		enabled: #loadSolutionButtonEnabled;
		frame: (LayoutFrame new
			leftFraction: self buttonWidth;
			topFraction: (1 - (2 * self buttonHeight));
			rightFraction: self buttonWidth * 2;
			bottomFraction: (1 - self buttonHeight)).
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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:25'
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
			bottomFraction: (2 * self titleBarHeight)).
]

{
	#category : #building,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:25'
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
			bottomFraction: 0.4).
]

{
	#category : #building,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:25'
}
IPTBrowser >> buildPlayButtonWith: aBuilder [

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: #playButtonLabel;
		action: #playButtonAction;
		enabled: true;
		frame: (LayoutFrame new
			leftFraction: 0;
			topFraction: (1 - self buttonHeight);
			rightFraction: 0.25 / 2;
			bottomFraction: 1).
]

{
	#category : #building,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:25'
}
IPTBrowser >> buildPlaygroundWith: aBuilder [

	^ aBuilder pluggablePanelSpec new
		model: self;
		children: #playgroundInCollection;
		frame: (LayoutFrame new
			leftFraction: 0.25;
			topFraction: 0;
			rightFraction: 0.75;
			bottomFraction: 0.5).
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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:25'
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
			bottomFraction: (2 * self titleBarHeight)).
]

{
	#category : #building,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:25'
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
			bottomFraction: 1).
]

{
	#category : #building,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:26'
}
IPTBrowser >> buildSqueakyPanelWith: aBuilder [

	^ aBuilder pluggablePanelSpec new
		model: self;
		children: #squeakyInCollection;
		frame: (LayoutFrame new
			leftFraction: 0.75;
			topFraction: 0.8;
			rightFraction: 1;
			bottomFraction: 1).
]

{
	#category : #building,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:26'
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
			bottomFraction: self titleBarHeight).
]

{
	#category : #building,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:26'
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
			self buildLoadSolutionButtonWith: aBuilder.
			self buildSqueakyPanelWith: aBuilder.
			self buildTitleBarWith: aBuilder. }).
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:27'
}
IPTBrowser >> buttonHeight [

	^ 0.08.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:27'
}
IPTBrowser >> buttonWidth [

	^ 0.125.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:27'
}
IPTBrowser >> chapter [

	^ chapter.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:27'
}
IPTBrowser >> chapter: aChapter [

	chapter := aChapter.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:27'
}
IPTBrowser >> classSet [

	^ classSet.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:28'
}
IPTBrowser >> classSet: aClassSet [

	classSet := aClassSet.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 11:33'
}
IPTBrowser >> clearPlayground [

	self playground clear.
	self update.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:28'
}
IPTBrowser >> close [

	self changed: #close.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:28'
}
IPTBrowser >> codeEditor [

	^ codeEditor.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:28'
}
IPTBrowser >> codeEditor: aCodeEditor [

	codeEditor := aCodeEditor.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'sv 7/3/2024 09:45'
}
IPTBrowser >> explanationBoxContent [
	
	^ self activeLevel explanations at: self explanationIndex.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:29'
}
IPTBrowser >> explanationIndex [

	^ explanationIndex.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:29'
}
IPTBrowser >> explanationIndex: aNumber [

	explanationIndex := aNumber.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:29'
}
IPTBrowser >> homeButtonAction [

	self ipt openChapterView.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:57'
}
IPTBrowser >> initialize [

	super initialize.
	self 
		codeEditor: (IPTEditor openOnBrowser: self);
		playground: IPTPlayground new;
		squeaky: IPTSqueaky new.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:30'
}
IPTBrowser >> ipt [

	^ ipt.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:30'
}
IPTBrowser >> ipt: anIPT [

	ipt := anIPT.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:30'
}
IPTBrowser >> levelIndex [

	^ levelIndex.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:30'
}
IPTBrowser >> levelIndex: aNumber [

	levelIndex := aNumber.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'FH 7/12/2024 18:39'
}
IPTBrowser >> loadLevel: aLevelIndex [

	self 
		levelIndex: aLevelIndex;
		explanationIndex: 1;
		reloadCodePieces;
		testResult: nil;
		selectCodePiece: nil;
		updateVisibleClassSetToMethods: self activeLevel visibleMethods.
		
	self playground ifNotNil: [self playground clear].
		
	self squeaky mood: #neutral.
	self
		update;
		changed: #expandRootsRequested.
	
		
	
]

{
	#category : #actions,
	#'squeak_changestamp' : 'FH 7/12/2024 18:40'
}
IPTBrowser >> loadSolutionButtonAction [
	
	self levelIndex ifNotNil: [
		self 
			selectedCodePiece loadSolutionCodeForLevel: self levelIndex andChapter: self chapter chapterNumber;
			compileCode.
		self codeEditor setCodePiece: self selectedCodePiece.
		self clearPlayground].
	
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Josua Zehner 7/6/2024 17:30'
}
IPTBrowser >> loadSolutionButtonEnabled [

	^ self selectedCodePiece isNil not
		and: [self selectedCodePiece isClass not]
		and: [self selectedCodePiece readOnly not].
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 11:36'
}
IPTBrowser >> nextExplanationButtonAction [

	self explanationIndex: self explanationIndex + 1.
	self update.
	
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:32'
}
IPTBrowser >> nextExplanationButtonEnabled [

	^ self activeLevel explanations size > self explanationIndex.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:32'
}
IPTBrowser >> nextLevelButtonAction [

	self loadLevel: (self levelIndex + 1).
	
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:32'
}
IPTBrowser >> nextLevelButtonEnabled [

	^ self chapter levels size > self levelIndex.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 11:45'
}
IPTBrowser >> outputBoxContent [

	| output |
	output := ''.
	
	self testResult ifNotNil: [ :testResult |
		(testResult at: #success) ifTrue: [^ 'Well done! :)'].
		output := ((testResult at: #errors) inject: (output, 'Errors: ') into: [:run :err |
			 run, Character cr, (IPTLevel resultEntryToString: err)]), Character cr, Character cr, 'Test failures: '.
		output := ((testResult at: #failures) inject: (output, 'Test failures:') into: [:run :err |
			 run, Character cr, (IPTLevel resultEntryToString: err)])].
	^ output.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:33'
}
IPTBrowser >> playButtonAction [

	self playground isRunning
		ifTrue: [self clearPlayground]
		ifFalse: [self runCode].
		
	self update.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Felix Knöfel 7/8/2024 15:39'
}
IPTBrowser >> playButtonLabel [
	
	self playground isRunning
		ifTrue: [^ 'Stop']
		ifFalse: [^ 'Play'].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/3/2024 20:09'
}
IPTBrowser >> playground [

	^ playground.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:34'
}
IPTBrowser >> playground: aPlayground [

	playground := aPlayground.
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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:34'
}
IPTBrowser >> previousExplanationButtonEnabled [

	^ self explanationIndex > 1.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:35'
}
IPTBrowser >> previousLevelButtonAction [

	self loadLevel: (self levelIndex - 1).
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:35'
}
IPTBrowser >> previousLevelButtonEnabled [

	^ self levelIndex > 1.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:38'
}
IPTBrowser >> reloadCodePieces [

	self classSet do: [ :iptClass | 
		iptClass methodCodePieces do: [ :codePiece | 
			codePiece
				isGreen: false;
				loadInitialCodeForLevel: self levelIndex andChapter: self chapter chapterNumber.]].
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 13:57'
}
IPTBrowser >> resetButtonAction [

	self levelIndex ifNotNil: [
		self selectedCodePiece 
			loadInitialCodeForLevel: self levelIndex andChapter: self chapter chapterNumber;
			compileCode.
		self codeEditor setCodePiece: self selectedCodePiece.
		self clearPlayground].
	
	
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
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 11:46'
}
IPTBrowser >> runCode [
	
	 self testResult: self activeLevel runTests.
	
	(self testResult at: #isPlayable)
		ifTrue: [self playground runCode].
		
	self 
		updateSqueaky;
		updateCodePieceTestIndicators;
		update.

]

{
	#category : #actions,
	#'squeak_changestamp' : 'Josua Zehner 7/6/2024 17:03'
}
IPTBrowser >> selectCodePiece: aCodePiece [

	self selectedCodePiece: aCodePiece.
	self codeEditor setCodePiece: aCodePiece.
	self update.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:38'
}
IPTBrowser >> selectedCodePiece [

	^ selectedCodePiece.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:39'
}
IPTBrowser >> selectedCodePiece: aCodePiece [

	selectedCodePiece := aCodePiece.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:39'
}
IPTBrowser >> squeaky [

	^ squeaky.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:39'
}
IPTBrowser >> squeaky: anIPTSqueaky [

	squeaky := anIPTSqueaky.
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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:40'
}
IPTBrowser >> testResult [

	^ testResult.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:40'
}
IPTBrowser >> testResult: aTestResult [

	testResult := aTestResult.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:40'
}
IPTBrowser >> titleBarContent [

	^ self activeLevel asString.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:40'
}
IPTBrowser >> titleBarHeight [

	^ 0.05.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:40'
}
IPTBrowser >> update [

	self 
		changed: #levelIndex;
		changed: #titleBarContent;
		changed: #outputBoxContent;
		changed: #nextLevelButtonEnabled;
		changed: #previousLevelButtonEnabled;
		changed: #loadSolutionButtonEnabled;
		changed: #resetButtonEnabled;
		changed: #visibleClassSet;
		changed: #explanationBoxContent;
		changed: #previousExplanationButtonEnabled;
		changed: #nextExplanationButtonEnabled;
		changed: #squeakyInCollection;
		changed: #playButtonLabel.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 13:35'
}
IPTBrowser >> updateCodePieceTestIndicators [

	| results |
	results := (self testResult at: #errors), (self testResult at: #failures).
	
	self visibleClassSet do: [ :iptClass |
		iptClass methodCodePieces do: [ :codePiece | 
			codePiece isGreen: (results noneSatisfy: [ :entry |
				 codePiece isSameSourceAs: (entry at: #method)])]].
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:46'
}
IPTBrowser >> updateSqueaky [
	
	((self testResult at: #errors) isEmpty and: [(self testResult at: #failures) isEmpty]) 
		ifTrue: [self squeaky mood: #happy]
		ifFalse: [self squeaky mood: #sad].
	
	
]

{
	#category : #actions,
	#'squeak_changestamp' : 'FH 7/12/2024 18:46'
}
IPTBrowser >> updateVisibleClassSetToMethods: aMethodsCollection [	
	
	self visibleClassSet: ((self classSet deepCopy) asOrderedCollection).
	
	self visibleClassSet removeAllSuchThat: [:iptClass |
		iptClass methodCodePieces 
			removeAllSuchThat: [:codePiece |
				aMethodsCollection noneSatisfy: [ :compiledMethod | 
					codePiece isSameSourceAs: compiledMethod]];
			isEmpty].
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:49'
}
IPTBrowser >> visibleClassSet [

	^ visibleClassSet.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:49'
}
IPTBrowser >> visibleClassSet: aClassSet [

	visibleClassSet := aClassSet.
]
