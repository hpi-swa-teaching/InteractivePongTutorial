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
		'visibleClassSet'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 14:26'
}
IPTBrowser class >> openFrom: anIPT chapter: aChapter levelIndex: aNumber [
	^ ToolBuilder open: (self new 
		ipt: anIPT;
		chapter: aChapter;
		loadLevel: aNumber).
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
	#'squeak_changestamp' : 'JZ 6/7/2024 15:37'
}
IPTBrowser >> buildResetButtonWith: aBuilder [

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: 'Reset';
		enabled: false;
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
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 12:20'
}
IPTBrowser >> buildVerifyButtonWith: aBuilder [

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: #verifyButtonContent;
		action: #verifyCode;
		enabled: true;
		frame: (LayoutFrame new
			leftFraction: 0;
			topFraction: (1 - self buttonHeight);
			rightFraction: 0.25 / 2;
			bottomFraction: 1)
]

{
	#category : #building,
	#'squeak_changestamp' : 'FH 6/15/2024 11:13'
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
			self buildVerifyButtonWith: aBuilder.
			self buildResetButtonWith: aBuilder.
			self buildHomeButtonWith: aBuilder.
			self buildNextLevelButtonWith: aBuilder.
			self buildPreviousLevelButtonWith: aBuilder.
			self buildShowSolutionButtonWith: aBuilder.
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
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 14:30'
}
IPTBrowser >> checkAndSaveCode [
	| code |
	
	Transcript show: 'trying to save', Character cr.
	self closeAllAutoCompletionMorphs.
	
	code := self codeEditor
		"accept;"
		code.
	self selectedMethod checkSyntaxAndSaveCode: code.
		
	"self playground clear."
	"self selectedLecture checkCode: code on: self playground."
	
	"self changed: #categoryList"

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 14:09'
}
IPTBrowser >> classSet [
	classSet ifNil: [self classSet: IPTClass testClassList].
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
IPTBrowser >> descriptionBoxContent1 [
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
	#'squeak_changestamp' : 'JZ 6/7/2024 16:06'
}
IPTBrowser >> homeButtonAction [
	self ipt openChapterView.
	self changed: #close.
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
	#'squeak_changestamp' : 'Felix Knöfel 6/17/2024 11:50'
}
IPTBrowser >> loadLevel: aLevelIndex [
	self levelIndex: aLevelIndex.
	
	self classSet do: [ :c | 
		c methodCodePieces do: [ :codePiece | 
			codePiece loadInitialCodeForLevel: self levelIndex andChapter: self activeLevel chapterNumber]].
	
	self updateVisibleClassSetToMethods: self activeLevel visibleMethods.
	
	"self codeEditor accept."
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
	#'squeak_changestamp' : 'Felix Knöfel 6/15/2024 13:32'
}
IPTBrowser >> selectMethod: aMethod [
	self selectedMethod: aMethod.
	
	self codeEditor activeCodePiece: aMethod.
	
	self changed: #selectedMethod.
	self changed: #showSolutionButtonEnabled.
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
	#'squeak_changestamp' : 'Felix Knöfel 6/17/2024 11:50'
}
IPTBrowser >> showSolutionButtonAction [
	self levelIndex ifNotNil: [
		self selectedMethod loadSolutionCodeForLevel: self levelIndex andChapter: self activeLevel chapterNumber.
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
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 6/15/2024 12:38'
}
IPTBrowser >> update [
	self 
		changed: #levelIndex;
		changed: #titleBarContent;
		changed: #descriptionBoxContent;
		changed: #nextLevelButtonEnabled;
		changed: #previousLevelButtonEnabled;
		changed: #visibleClassSet.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 6/15/2024 12:44'
}
IPTBrowser >> updateVisibleClassSetToMethods: aMethodsCollection [
	self visibleClassSet: ((self classSet collect: [ :klass | klass copy. ]) asOrderedCollection).

	aMethodsCollection ifNil: [ ^nil.].
	
	"Show all classes with methods that are in 'activeLevel visibleMethods'. If there are no methods in a class, dont show it"
	self visibleClassSet removeAllSuchThat: [ :klass | 
		klass methodCodePieces removeAllSuchThat: [ :codePiece | 
			(aMethodsCollection anySatisfy: [ :method | 
				method = codePiece methodToBeChanged ]) not].
		klass methodCodePieces isEmpty. ].
	
		
	
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:48'
}
IPTBrowser >> verifyButtonContent [
	^ 'Verify'
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/15/2024 13:33'
}
IPTBrowser >> verifyCode [
	
	self descriptionBoxContent: (self activeLevel runTest: (self selectedMethod name)).
	self update.

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
