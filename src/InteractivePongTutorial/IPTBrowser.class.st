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
		'descriptionBoxContent',
		'visibleClassSet',
		'playground'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/18/2024 16:49'
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
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:20'
}
IPTBrowser >> buildDescriptionBoxWith: aBuilder [

	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #descriptionBoxContent;
		readOnly: true;
		indicateUnacceptedChanges: false;
		frame: (LayoutFrame new
			leftFraction: 0.75;
			topFraction: 0;
			rightFraction: 1;
			bottomFraction: 1)
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
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 11:07'
}
IPTBrowser >> buildWith: aBuilder [
	^ aBuilder build: (aBuilder pluggableWindowSpec new
		model: self;
		label: 'Interactive Pong Tutorial: ', self chapter name;
		extent: (1400@800);
		children: {
			self buildDescriptionBoxWith: aBuilder.
			self buildTitleBarWith: aBuilder.
			self buildCodeEditorWith: aBuilder.
			self buildCodePieceListWith: aBuilder.
			self buildPlayButtonWith: aBuilder.
			self buildResetButtonWith: aBuilder.
			self buildHomeButtonWith: aBuilder.
			self buildNextLevelButtonWith: aBuilder.
			self buildPreviousLevelButtonWith: aBuilder.
			self buildShowSolutionButtonWith: aBuilder.
			self buildPlaygroundWith: aBuilder.
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
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/15/2024 13:29'
}
IPTBrowser >> descriptionBoxContent [
	^ descriptionBoxContent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/15/2024 13:29'
}
IPTBrowser >> descriptionBoxContent: anObject [
	descriptionBoxContent := anObject
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
	#'squeak_changestamp' : 'Felix Knöfel 6/24/2024 00:29'
}
IPTBrowser >> loadLevel: aLevelIndex [
	self 
		levelIndex: aLevelIndex;
		selectMethod: nil.
	
	self 
		updateVisibleClassSetToMethods: self activeLevel visibleCodePieces;
		update.
		
	self classSet do: [ :c | 
		c methodCodePieces do: [ :codePiece | 
			codePiece loadInitialCodeForLevel: self levelIndex andChapter: self chapter chapterNumber]].
	
	self playground ifNotNil: [
		self playground removeAllMorphs.].
	self update.
	
		
	
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
	#'squeak_changestamp' : 'Felix Knöfel 6/23/2024 23:31'
}
IPTBrowser >> runCode [
	
	| errors failures testResult output |
	
	 testResult := self activeLevel runTests.
	 failures := testResult at: #failures.
	 errors := testResult at: #errors.
	
	output := ''.
	
	(errors isEmpty and: [failures isEmpty])
		ifTrue: [self playground runCode.].
		
	output := (errors inject: 'Errors:' into: [:run :elem | run, Character cr, elem ]), Character cr, Character cr.
	output := (failures inject: (output, 'Failures:') into: [:run :elem | run, Character cr, elem ]).
	
	(testResult at: #success) ifTrue: [
			output := 'Well done! :)'.
	].
	
	self descriptionBoxContent: output.
		
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
	#category : #ui,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:06'
}
IPTBrowser >> titleBarContent [
	^ self activeLevel name.
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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/20/2024 16:49'
}
IPTBrowser >> update [
	self 
		changed: #levelIndex;
		changed: #titleBarContent;
		changed: #descriptionBoxContent;
		changed: #nextLevelButtonEnabled;
		changed: #previousLevelButtonEnabled;
		changed: #showSolutionButtonEnabled;
		changed: #ResetButtonEnabled;
		changed: #visibleClassSet.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 6/24/2024 11:58'
}
IPTBrowser >> updateVisibleClassSetToMethods: aMethodsCollection [
	self visibleClassSet: ((self classSet collect: [ :iptclass | iptclass copy. ]) asOrderedCollection).
	
	aMethodsCollection ifNil: [ ^nil.].
	
	"Show all classes with methods that are in 'activeLevel visibleMethods'. If there are no methods in a class, dont show it"
	self visibleClassSet removeAllSuchThat: [ :klass | 
		klass methodCodePieces removeAllSuchThat: [ :codePiece | 
			(aMethodsCollection anySatisfy: [ :method | 
				((method asString splitBy: '"') at: 1) = 
					((codePiece methodToBeChanged asString splitBy: '"') at: 1)]) not].
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
