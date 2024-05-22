Class {
	#name : #IPTBrowser,
	#superclass : #MotuBrowser,
	#category : #InteractivePongTutorial
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 5/22/2024 11:39'
}
IPTBrowser class >> defaultLabel [
	^ 'Interactive Pong Tutorial'
]

{
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 5/22/2024 12:15'
}
IPTBrowser >> buildCodeEditorWith: aBuilder [

	^ (self codeEditor buildCodePaneWith: aBuilder)
		frame: (LayoutFrame new
			leftFraction: 0.2;
			topFraction: 0.45 offset: self codeStatusBarHeight;
			rightFraction: 0.8;
			bottomFraction: 1 offset: self evaluateButtonHeight negated)


]

{
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 5/22/2024 12:24'
}
IPTBrowser >> buildCodeStatusBarWith: aBuilder [

	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #codeStatusBarContentStyled;
		color: #codeStatusBarColor;
		readOnly: true;
		indicateUnacceptedChanges: false;
		frame: (LayoutFrame new
			leftFraction: 0.2;
			topFraction: 0.45;
			rightFraction: 0.8;
			bottomFraction: 0.45 offset: (self codeStatusBarHeight / 2))
]

{
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 5/22/2024 12:19'
}
IPTBrowser >> buildContextBarWith: aBuilder [

	^ aBuilder pluggableCodePaneSpec new
		model: self;
		getText: #contextBarContent;
		readOnly: true;
		indicateUnacceptedChanges: false;
		minimumHeight: (self codeStatusBarHeight / 2);
		frame: (LayoutFrame new
			leftFraction: 0.2;
			topFraction: 0.45 offset: (self codeStatusBarHeight / 2);
			rightFraction: 0.8;
			bottomFraction: 0.45 offset: self codeStatusBarHeight)
]

{
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 5/22/2024 12:12'
}
IPTBrowser >> buildDescriptionBoxWith: aBuilder [

	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #descriptionBoxContent;
		readOnly: true;
		indicateUnacceptedChanges: false;
		frame: (LayoutFrame new
			leftFraction: 0.8;
			topFraction: 0;
			rightFraction: 1;
			bottomFraction: 1)
]

{
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 5/22/2024 12:15'
}
IPTBrowser >> buildLectureListWith: aBuilder [

	^ aBuilder pluggableTreeSpec new
		model: self;
		roots: #categoryList;
		nodeClass: MotuLectureCategoryListItemWrapper;
		getSelected: #selectedLecture;
		setSelected: #selectedLecture:;
		autoDeselect: true;
		frame: (LayoutFrame new
			leftFraction: 0;
			topFraction: 0;
			rightFraction: 0.2;
			bottomFraction: 1)
]

{
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 5/22/2024 12:20'
}
IPTBrowser >> buildPlaygroundPanelWith: aBuilder [
	
	^ aBuilder pluggablePanelSpec new
		model: self;
		children: #playgroundInCollection;
		frame: (LayoutFrame new
			leftFraction: 0.2;
			topFraction: 0;
			rightFraction: 0.8;
			bottomFraction: 0.45)
]

{
	#category : #style,
	#'squeak_changestamp' : 'Felix Knöfel 5/22/2024 11:49'
}
IPTBrowser >> windowColorToUse [
	^ Color white darker
]
