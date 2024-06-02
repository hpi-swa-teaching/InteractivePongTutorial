Class {
	#name : #IPTScratchBrowser,
	#superclass : #Model,
	#instVars : [
		'codeEditor',
		'selectedMethod'
	],
	#category : #InteractivePongTutorial
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 11:19'
}
IPTScratchBrowser class >> open [
	^ self new open.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 12:38'
}
IPTScratchBrowser >> buildCodeEditorWith: aBuilder [

	^ (self codeEditor buildCodePaneWith: aBuilder)
		frame: (LayoutFrame new
			leftFraction: 0.25;
			topFraction: 0.5;
			rightFraction: 0.75;
			bottomFraction: 1)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 12:25'
}
IPTScratchBrowser >> buildDescriptionBoxWith: aBuilder [

	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #descriptionBoxContent;
		readOnly: true;
		indicateUnacceptedChanges: false;
		frame: (LayoutFrame new
			leftFraction: 0.75;
			topFraction: self titleBarHeight;
			rightFraction: 1;
			bottomFraction: 1)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:55'
}
IPTScratchBrowser >> buildHomeButtonWith: aBuilder [

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: #homeButtonContent;
		enabled: false;
		frame: (LayoutFrame new
			leftFraction: 0.95;
			topFraction: 0;
			rightFraction: 1;
			bottomFraction: self titleBarHeight)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:45'
}
IPTScratchBrowser >> buildMethodListWith: aBuilder [

	^ aBuilder pluggableTreeSpec new
		model: self;
		roots: #visibleClassSet;
		nodeClass: IPTClassListItemWrapper;
		getSelected: #selectedMethod;
		setSelected: #selectedMethod:;
		autoDeselect: true;
		frame: (LayoutFrame new
			leftFraction: 0;
			topFraction: self titleBarHeight;
			rightFraction: 0.25;
			bottomFraction: (1 - self buttonHeight))
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:48'
}
IPTScratchBrowser >> buildResetButtonWith: aBuilder [

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: #resetButtonContent;
		enabled: false;
		frame: (LayoutFrame new
			leftFraction: 0.25 / 2;
			topFraction: (1 - self buttonHeight);
			rightFraction: 0.25;
			bottomFraction: 1)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:56'
}
IPTScratchBrowser >> buildTitleBarWith: aBuilder [

	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #titleBarContent;
		readOnly: true;
		indicateUnacceptedChanges: false;
		frame: (LayoutFrame new
			leftFraction: 0;
			topFraction: 0;
			rightFraction: 0.95;
			bottomFraction: self titleBarHeight)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:49'
}
IPTScratchBrowser >> buildVerifyButtonWith: aBuilder [

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: #verifyButtonContent;
		enabled: false;
		frame: (LayoutFrame new
			leftFraction: 0;
			topFraction: (1 - self buttonHeight);
			rightFraction: 0.25 / 2;
			bottomFraction: 1)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:56'
}
IPTScratchBrowser >> buildWith: aBuilder [
	^ aBuilder build: (aBuilder pluggableWindowSpec new
		model: self;
		label: 'Interactive Pong Tutorial';"#labelString;"
		extent: (1200@800);"self class defaultExtent;"
		children: {
			self buildDescriptionBoxWith: aBuilder.
			self buildTitleBarWith: aBuilder.
			self buildCodeEditorWith: aBuilder.
			self buildMethodListWith: aBuilder.
			self buildVerifyButtonWith: aBuilder.
			self buildResetButtonWith: aBuilder.
			self buildHomeButtonWith: aBuilder.
			"self buildCodeEditorWith: aBuilder.
			self buildEvaluateButtonWith: aBuilder.
			self buildResetLectureButtonWith: aBuilder.
			self buildSolutionToggleButtonWith: aBuilder.
			self buildPlaygroundPanelWith: aBuilder.
			self buildCodeStatusBarWith: aBuilder.
			self buildContextBarWith: aBuilder."
			};
		yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:43'
}
IPTScratchBrowser >> buttonHeight [
	^ 0.1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 12:35'
}
IPTScratchBrowser >> codeEditor [

	codeEditor ifNil: [self codeEditor: (MotuEditor new actionOnSave: [])].
	^ codeEditor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 12:35'
}
IPTScratchBrowser >> codeEditor: anObject [
	codeEditor := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 11:39'
}
IPTScratchBrowser >> descriptionBoxContent [
	^ 'Hello World!'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:55'
}
IPTScratchBrowser >> homeButtonContent [
	^ 'Home'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 12:32'
}
IPTScratchBrowser >> initialize [
	self codeEditor: MotuEditor new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 17:21'
}
IPTScratchBrowser >> open [
	^ ToolBuilder open: self.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:48'
}
IPTScratchBrowser >> resetButtonContent [
	^ 'Reset'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:14'
}
IPTScratchBrowser >> selectedMethod [
	^ selectedMethod
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:35'
}
IPTScratchBrowser >> selectedMethod: anObject [
	selectedMethod := anObject.
	
	Transcript show: anObject.
	
	self changed: #selectedMethod.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:52'
}
IPTScratchBrowser >> titleBarContent [
	^ 'Kapitel 2 - Level 3: Welcome to SqueakLand!'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 12:12'
}
IPTScratchBrowser >> titleBarHeight [
	^ 0.05
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 11:48'
}
IPTScratchBrowser >> verifyButtonContent [
	^ 'Verify'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 10:50'
}
IPTScratchBrowser >> visibleClassSet [
	^ {'foo'.'bar'.'xyz'}
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/2/2024 10:20'
}
IPTScratchBrowser >> windowColorToUse [ 
	^ Color white darker.
]
