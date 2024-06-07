Class {
	#name : #IPTChapterView,
	#superclass : #Model,
	#instVars : [
		'selectedLevel',
		'chapters',
		'selectedChapter',
		'descriptionText'
	],
	#category : #InteractivePongTutorial
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JZ 6/5/2024 12:18'
}
IPTChapterView class >> open [
	^ ToolBuilder open: self new
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:51'
}
IPTChapterView >> buildChapterListWith: aBuilder [
	^ aBuilder pluggableListSpec new
		model: self;
		list: #chapters;
		getSelected: #selectedChapter;
		setSelected: #selectedChapter:;
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
IPTChapterView >> buildDescriptionBoxWith: aBuilder [

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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 11:03'
}
IPTChapterView >> buildLevelListWith: aBuilder [
	^ aBuilder pluggableListSpec new
		model: self;
		list: #levels;
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
IPTChapterView >> buildStartButtonWith: aBuilder [
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
IPTChapterView >> buildWith: aBuilder [
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
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:49'
}
IPTChapterView >> chapters [
	^ {IPTChapter withName: 'Introduction' number: 1 description: 'This is Chapter 1' levels: {IPTLevel0101 		new}}
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:41'
}
IPTChapterView >> chapters: anObject [
	chapters := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:58'
}
IPTChapterView >> descriptionText [
	^ selectedChapter description.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 11:06'
}
IPTChapterView >> descriptionText: aString [
	descriptionText := aString
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 11:13'
}
IPTChapterView >> initialize [
	self chapters: self chapters.
	self selectedChapter: (self chapters at: 1).
	self selectedLevel: (self levels at: 1).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 11:03'
}
IPTChapterView >> levels [
	^ self selectedChapter levels.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:51'
}
IPTChapterView >> selectedChapter [
	^ selectedChapter
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:55'
}
IPTChapterView >> selectedChapter: anObject [
	selectedChapter := anObject.
	Transcript show: anObject.
	self changed: #selectedChapter.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 13:25'
}
IPTChapterView >> selectedLevel [
	^ selectedLevel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 11:07'
}
IPTChapterView >> selectedLevel: anObject [
	selectedLevel := anObject.	
	Transcript show: anObject.
	self descriptionText: selectedLevel description.
	self changed: #selectedLevel.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JZ 6/5/2024 12:15'
}
IPTChapterView >> startSelectedLevel [
	IPTScratchBrowser open. 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 13:25'
}
IPTChapterView >> windowColorToUse [ 
	^ Color white darker.
]
