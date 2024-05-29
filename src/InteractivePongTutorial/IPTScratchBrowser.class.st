Class {
	#name : #IPTScratchBrowser,
	#superclass : #Object,
	#instVars : [
		'codeEditor'
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
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 12:25'
}
IPTScratchBrowser >> buildTitleBarWith: aBuilder [

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: #titleBarContent;
		enabled: false;
		frame: (LayoutFrame new
			leftFraction: 0;
			topFraction: 0;
			rightFraction: 1;
			bottomFraction: self titleBarHeight)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 12:36'
}
IPTScratchBrowser >> buildWith: aBuilder [
	^ aBuilder build: (aBuilder pluggableWindowSpec new
		model: self;
		label: 'Interactive Pong Tutorial';"#labelString;"
		extent: (800@800);"self class defaultExtent;"
		children: {
			self buildDescriptionBoxWith: aBuilder.
			self buildTitleBarWith: aBuilder.
			self buildCodeEditorWith: aBuilder.
			"self buildLectureListWith: aBuilder.
			self buildCodeEditorWith: aBuilder.
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
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 12:32'
}
IPTScratchBrowser >> initialize [
	self codeEditor: MotuEditor new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 11:18'
}
IPTScratchBrowser >> open [
	^ ToolBuilder open: self.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 11:58'
}
IPTScratchBrowser >> titleBarContent [
	^ 'This is a Title'
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
	#'squeak_changestamp' : 'Felix Knöfel 5/29/2024 11:53'
}
IPTScratchBrowser >> windowColorToUse [ 
	^ Color plum.
]
