Class {
	#name : #IPTBrowser,
	#superclass : #Model,
	#instVars : [
		'ipt',
		'codeEditor',
		'selectedMethod',
		'chapter',
		'levelIndex',
		'classSet',
		'testResult',
		'explanationIndex',
		'visibleClassSet',
		'playground',
		'squeakyCollection'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 14:11'
}
IPTBrowser class >> openFrom: anIPT chapter: aChapter levelIndex: aNumber [

	| browser |
	browser := self new 
		ipt: anIPT;
		chapter: aChapter;
		loadLevel: aNumber;
		playground: IPTPlayground new;
		yourself.
	ToolBuilder open: browser.
	^ browser
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/20/2024 16:48'
}
IPTBrowser >> ResetButtonAction [
	self levelIndex ifNotNil: [
		self selectedMethod loadInitialCodeForLevel: self levelIndex andChapter: self chapter chapterNumber.
		self codeEditor activeCodePiece: self selectedMethod.
	].
	
	
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/20/2024 16:47'
}
IPTBrowser >> ResetButtonEnabled [

	^ self selectedMethod isNil not and: [self selectedMethod hasBody].
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
	#'squeak_changestamp' : 'Felix Knöfel 6/15/2024 12:26'
}
IPTBrowser >> buildCodePieceListWith: aBuilder [

	^ aBuilder pluggableTreeSpec new
		model: self;
		roots: #visibleClassSet;
		nodeClass: IPTClassListItemWrapper;
		getSelected: #selectedMethod;
		setSelected: #selectMethod:;
		autoDeselect: true;
		frame: (LayoutFrame new
			leftFraction: 0;
			topFraction: (2 * self titleBarHeight);
			rightFraction: 0.25;
			bottomFraction: (1 - (2 * self buttonHeight)))
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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/20/2024 16:47'
}
IPTBrowser >> buildResetButtonWith: aBuilder [

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: 'Reset';
		action: #ResetButtonAction;
		enabled: #ResetButtonEnabled;
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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 12:37'
}
IPTBrowser >> buildSqueakyWith: aBuilder [

	^ aBuilder pluggablePanelSpec new
		model: self;
		children: #squeakyCollection;
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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 12:38'
}
IPTBrowser >> buildWith: aBuilder [
	^ aBuilder build: (aBuilder pluggableWindowSpec new
		model: self;
		label: 'Interactive Pong Tutorial: ', self chapter name;
		extent: (1400@800);
		children: {
			
			self buildTitleBarWith: aBuilder.
			self buildCodePieceListWith: aBuilder.
			self buildCodeEditorWith: aBuilder.
			
			self buildPlayButtonWith: aBuilder.
			self buildResetButtonWith: aBuilder.
			self buildHomeButtonWith: aBuilder.
			self buildNextLevelButtonWith: aBuilder.
			self buildPreviousLevelButtonWith: aBuilder.
			self buildShowSolutionButtonWith: aBuilder.
			self buildPlaygroundWith: aBuilder.
			self buildOutputBoxWith: aBuilder.
			self buildExplanationBoxWith: aBuilder.
			self buildPreviousExplanationButtonWith: aBuilder.
			self buildNextExplanationButtonWith: aBuilder.
			self buildSqueakyWith: aBuilder.
			};
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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/20/2024 16:48'
}
IPTBrowser >> checkAndSaveCode [
	| code errMsg |
	self closeAllAutoCompletionMorphs.
	
	code := self codeEditor
		"accept;"
		code.
	errMsg := self selectedMethod checkSyntaxAndSaveCode: code.
	
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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 14:10'
}
IPTBrowser >> loadLevel: aLevelIndex [
	self 
		levelIndex: aLevelIndex;
		selectMethod: nil;
		explanationIndex: 1.
	
	self 
		updateVisibleClassSetToMethods: self activeLevel visibleCodePieces;
		update.
		
	self classSet do: [ :c | 
		c methodCodePieces do: [ :codePiece | 
			codePiece loadInitialCodeForLevel: self levelIndex andChapter: self chapter chapterNumber]].
	
	self playground ifNotNil: [
		self playground removeAllMorphs.].
	
	self setsqueakyNeutral.
	self update.
	
		
	
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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 13:59'
}
IPTBrowser >> outputBoxContent [
	| output |
	output := ''.
	self testResult ifNotNil: [
	output := ((self testResult at: #errors) inject: 'Errors:' into: [:run :elem | run, Character cr, elem ]), Character cr, Character cr.
	output := ((self testResult at: #failures) inject: (output, 'Failures:') into: [:run :elem | run, Character cr, elem ]).
	
	(self testResult at: #success) ifTrue: [
			output := 'Well done! :)'.
	].].

	^ output.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/18/2024 16:47'
}
IPTBrowser >> playground [
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
	#'squeak_changestamp' : 'Felix Knöfel 6/18/2024 16:48'
}
IPTBrowser >> playgroundInCollection [
	^ { self playground }.
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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 14:10'
}
IPTBrowser >> runCode [
	
	| errors failures |
	
	 self testResult: self activeLevel runTests.
	 failures := self testResult at: #failures.
	 errors := self testResult at: #errors.
	
	(errors isEmpty and: [failures isEmpty])
		ifTrue: [self playground runCode.].
		
	self updateSqueaky.
	self update.

]

{
	#category : #actions,
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 20:10'
}
IPTBrowser >> selectMethod: aMethod [
	self selectedMethod: aMethod.
	
	self codeEditor activeCodePiece: aMethod.
	
	self update.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:14'
}
IPTBrowser >> selectedMethod [
	^ selectedMethod
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 6/7/2024 15:40'
}
IPTBrowser >> selectedMethod: anObject [
	selectedMethod := anObject.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 12:39'
}
IPTBrowser >> setSqueaky: anImagePath [

	(self squeakyCollection at: 1)
			image: (((GitAssetLoader for: 'InteractivePongTutorial')
				loadForm: anImagePath)
					scaledToHeight: 200).
					
	self update.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 14:05'
}
IPTBrowser >> setsqueakyHappy [

	self setSqueaky: 'assets/squeaky-happy.png'.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 14:05'
}
IPTBrowser >> setsqueakyNeutral [

	self setSqueaky: 'assets/squeaky-neutr.png'.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 14:05'
}
IPTBrowser >> setsqueakySad [

	self setSqueaky: 'assets/squeaky-sad.png'.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/20/2024 16:41'
}
IPTBrowser >> showSolutionButtonAction [
	self levelIndex ifNotNil: [
		self selectedMethod loadSolutionCodeForLevel: self levelIndex andChapter: self chapter chapterNumber.
		self codeEditor activeCodePiece: self selectedMethod.
	].
	
	
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Felix Knöfel 6/15/2024 13:40'
}
IPTBrowser >> showSolutionButtonEnabled [

	^ self selectedMethod isNil not and: [self selectedMethod hasBody].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 12:40'
}
IPTBrowser >> squeakyCollection [

	squeakyCollection ifNil: [
		squeakyCollection := {ImageMorph new}	
	].

	 ^ squeakyCollection.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 12:35'
}
IPTBrowser >> squeakyCollection: anObject [
	squeakyCollection := anObject
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
	#'squeak_changestamp' : 'Josua Zehner 6/26/2024 12:15'
}
IPTBrowser >> update [
	self 
		changed: #levelIndex;
		changed: #titleBarContent;
		changed: #outputBoxContent;
		changed: #nextLevelButtonEnabled;
		changed: #previousLevelButtonEnabled;
		changed: #showSolutionButtonEnabled;
		changed: #ResetButtonEnabled;
		changed: #visibleClassSet;
		changed: #explanationBoxContent;
		changed: #previousExplanationButtonEnabled;
		changed: #nextExplanationButtonEnabled.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/26/2024 14:09'
}
IPTBrowser >> updateSqueaky [

	| errors failures |
	errors := self testResult at: #errors.
	failures := self testResult at: #failures.
	
	(errors isEmpty and: [failures isEmpty]) 
	ifTrue: [self setsqueakyHappy]
	ifFalse: [self setsqueakySad].
	
	
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 6/26/2024 14:40'
}
IPTBrowser >> updateVisibleClassSetToMethods: aMethodsCollection [
	self visibleClassSet: ((self classSet collect: [ :iptclass | iptclass copy. ]) asOrderedCollection).
	
	aMethodsCollection ifNil: [ ^nil.].
	
	"Show all classes with methods that are in 'activeLevel visibleMethods'. If there are no methods in a class, dont show it"
	self visibleClassSet removeAllSuchThat: [ :klass | 
		klass methodCodePieces removeAllSuchThat: [ :codePiece | 
			(aMethodsCollection anySatisfy: [ :method | 
				codePiece isSameSourceAs: method]) not].
		klass methodCodePieces isEmpty. ].
	
		
	
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
