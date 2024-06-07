Class {
	#name : #IPTChapterBrowser,
	#superclass : #Model,
	#instVars : [
		'selectedLevel',
		'ChapterList'
	],
	#category : #InteractivePongTutorial
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JZ 6/5/2024 12:18'
}
IPTChapterBrowser class >> open [
	^ ToolBuilder open: self new
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 16:41'
}
IPTChapterBrowser >> ChapterList [
	ChapterList ifNil: [ChapterList := IPTLevel Chapter].
	^ChapterList
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JZ 6/5/2024 12:24'
}
IPTChapterBrowser >> buildChapterListWith: aBuilder [
	^ aBuilder pluggableListSpec new
		model: self;
		list: #ChapterList;
		getSelected: #selectedLevel;
		setSelected: #selectedLevel:;
		autoDeselect: true;
		frame: (LayoutFrame new
			leftFraction: 0;
			topFraction: 0;
			rightFraction: 0.3;
			bottomFraction: 1)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JZ 6/5/2024 12:26'
}
IPTChapterBrowser >> buildDescriptionBoxWith: aBuilder [

	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #descriptionText;
		readOnly: true;
		indicateUnacceptedChanges: false;
		frame: (LayoutFrame new
			leftFraction: 0.3;
			topFraction: 0.45;
			rightFraction: 1;
			bottomFraction: 1)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JZ 6/5/2024 12:08'
}
IPTChapterBrowser >> buildLevelListWith: aBuilder [
	^ aBuilder pluggableListSpec new
		model: self;
		list: #ChapterList;
		getSelected: #selectedLevel;
		setSelected: #selectedLevel:;
		autoDeselect: true;
		frame: (LayoutFrame new
			leftFraction: 0.3;
			topFraction: 0;
			rightFraction: 1;
			bottomFraction: 0.4)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JZ 6/5/2024 12:16'
}
IPTChapterBrowser >> buildStartButtonWith: aBuilder [
	^ aBuilder pluggableButtonSpec new
		model: self;
		label: 'Start';
		action: #startSelectedLevel;
		frame: (LayoutFrame new
			leftFraction: 0.3;
			topFraction: 0.4;
			rightFraction: 0.65;
			bottomFraction: 0.45)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JZ 6/5/2024 12:27'
}
IPTChapterBrowser >> buildWith: aBuilder [
	^ aBuilder build: (aBuilder pluggableWindowSpec new
		model: self;
		label: 'Interactive Pong Tutorial';"#labelString;"
		extent: (1200@800);"self class defaultExtent;"
		children: {
			self buildChapterListWith: aBuilder.
			self buildLevelListWith: aBuilder.
			self buildStartButtonWith: aBuilder.
			self buildDescriptionBoxWith: aBuilder.
			};
		yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JZ 6/5/2024 12:22'
}
IPTChapterBrowser >> descriptionText [
	^ 'Blabla hallo welt was geht'.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 13:25'
}
IPTChapterBrowser >> selectedLevel [
	^ selectedLevel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 10:07'
}
IPTChapterBrowser >> selectedLevel: anObject [
	selectedLevel := anObject.
	
	Transcript show: anObject.
	IPTBrowser open. 
	
	self changed: #selectedLevel.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 6/5/2024 12:15'
}
IPTChapterBrowser >> startSelectedLevel [
	IPTScratchBrowser open. 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 13:25'
}
IPTChapterBrowser >> windowColorToUse [ 
	^ Color white darker.
]
