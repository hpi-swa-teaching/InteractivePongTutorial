"
This class displays the Chapter and levels and loads the selected Level into the IPTBrowser
"
Class {
	#name : #IPTChapterView,
	#superclass : #Model,
	#instVars : [
		'ipt',
		'selectedLevel',
		'chapters',
		'selectedChapter'
	],
	#category : #'InteractivePongTutorial-Core',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 10:40'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 11:55'
}
IPTChapterView class >> openFrom: anIPT [
	
	| chapterView |
	chapterView := self new ipt: anIPT.
	ToolBuilder open: chapterView.
	^ chapterView.
]

{
	#category : #building,
	#'squeak_changestamp' : 'FH 6/19/2024 14:24'
}
IPTChapterView >> buildChapterDescriptionBoxWith: aBuilder [

	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #chapterDescription;
		readOnly: true;
		indicateUnacceptedChanges: false;
		padding: self padding;
		frame: (LayoutFrame new
			leftFraction: 0;
			topFraction: 0.45;
			rightFraction: 0.3;
			bottomFraction: 1).
]

{
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 11:55'
}
IPTChapterView >> buildChapterListWith: aBuilder [

	^ aBuilder pluggableListSpec new
		model: self;
		list: #chapters;
		getSelected: #selectedChapter;
		setSelected: #selectChapter:;
		padding: self padding;
		frame: (LayoutFrame new
			leftFraction: 0;
			topFraction: 0;
			rightFraction: 0.3;
			bottomFraction: 0.45).
]

{
	#category : #building,
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 12:44'
}
IPTChapterView >> buildLevelDescriptionBoxWith: aBuilder [

	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #levelDescription;
		readOnly: true;
		padding: self padding;
		indicateUnacceptedChanges: false;
		frame: (LayoutFrame new
			leftFraction: 0.3;
			topFraction: 0.45;
			rightFraction: 1;
			bottomFraction: 1).
]

{
	#category : #building,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:04'
}
IPTChapterView >> buildLevelListWith: aBuilder [

	^ aBuilder pluggableListSpec new
		model: self;
		list: #levels;
		getSelected: #selectedLevel;
		setSelected: #selectLevel:;
		padding: self padding;
		frame: (LayoutFrame new
			leftFraction: 0.3;
			topFraction: 0;
			rightFraction: 1;
			bottomFraction: 0.4).
]

{
	#category : #building,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:05'
}
IPTChapterView >> buildStartButtonWith: aBuilder [

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: 'Start';
		action: #startSelectedLevel;
		enabled: #canStartLevel;
		padding: self padding;
		frame: (LayoutFrame new
			leftFraction: 0.3;
			topFraction: 0.4;
			rightFraction: 1;
			bottomFraction: 0.45).
]

{
	#category : #building,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:05'
}
IPTChapterView >> buildWith: aBuilder [

	^ aBuilder build: (aBuilder pluggableWindowSpec new
		model: self;
		label: 'Interactive Pong Tutorial: Chapter View';
		extent: (800@500);
		children: {
			self buildChapterListWith: aBuilder.
			self buildLevelListWith: aBuilder.
			self buildStartButtonWith: aBuilder.
			self buildChapterDescriptionBoxWith: aBuilder.
			self buildLevelDescriptionBoxWith: aBuilder.
		}).
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:05'
}
IPTChapterView >> canStartLevel [

	^ self selectedLevel isNil not.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:05'
}
IPTChapterView >> chapterDescription [

	^ self selectedChapter description.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:05'
}
IPTChapterView >> chapters [

	^ chapters.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:05'
}
IPTChapterView >> chapters: aChapter [

	chapters := aChapter.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:05'
}
IPTChapterView >> close [

	self changed: #close.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:05'
}
IPTChapterView >> initialize [

	self 
		chapters: IPTChapter chapterSet;
		selectedChapter: self chapters first;
		selectedLevel: (self levels 
			ifEmpty: [nil]
			ifNotEmpty: [self levels first]).
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:05'
}
IPTChapterView >> ipt [

	^ ipt.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:05'
}
IPTChapterView >> ipt: anIPT [

	ipt := anIPT.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:05'
}
IPTChapterView >> levelDescription [

	^ self selectedLevel 
		ifNotNil: [self selectedLevel description] 
		ifNil: [self noLevelSelectedMessage].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:06'
}
IPTChapterView >> levels [

	^ self selectedChapter levels 
		ifNil: [{}].
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:06'
}
IPTChapterView >> noLevelSelectedMessage [

	^ 'Please select a level.'.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:06'
}
IPTChapterView >> padding [

	^ 5.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 12:05'
}
IPTChapterView >> selectChapter: aChapter [	
	
	aChapter ifNotNil: [
		self 
			selectedChapter: aChapter;
			selectLevel: (aChapter levels 
				ifNotEmpty: [aChapter levels first] 
				ifEmpty: [nil]);
			update].
	
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:06'
}
IPTChapterView >> selectLevel: aLevel [

	self selectedLevel: aLevel.
	self update.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:06'
}
IPTChapterView >> selectedChapter [

	^ selectedChapter.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:06'
}
IPTChapterView >> selectedChapter: aChapter [

	selectedChapter := aChapter.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:06'
}
IPTChapterView >> selectedLevel [

	^ selectedLevel.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:07'
}
IPTChapterView >> selectedLevel: aLevel [

	selectedLevel := aLevel.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:07'
}
IPTChapterView >> startSelectedLevel [

	self ipt 
		openLevel: self selectedLevel levelIndex 
		inChapter: self selectedChapter.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:07'
}
IPTChapterView >> update [

	self 
		changed: #selectedChapter;
		changed: #levels;
		changed: #selectedLevel;
		changed: #levelDescription;
		changed: #chapterDescription;
		changed: #canStartLevel.
]
