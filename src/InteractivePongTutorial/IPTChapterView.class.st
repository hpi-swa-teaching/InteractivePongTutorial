Class {
	#name : #IPTChapterView,
	#superclass : #Model,
	#instVars : [
		'ipt',
		'selectedLevel',
		'chapters',
		'selectedChapter'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JZ 6/7/2024 13:29'
}
IPTChapterView class >> openFrom: anIPT [
	^ ToolBuilder open: (self new ipt: anIPT)
]

{
	#category : #building,
	#'squeak_changestamp' : 'JZ 6/7/2024 14:33'
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
			bottomFraction: 1)
]

{
	#category : #building,
	#'squeak_changestamp' : 'JZ 6/7/2024 14:32'
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
			bottomFraction: 0.45)
]

{
	#category : #building,
	#'squeak_changestamp' : 'JZ 6/7/2024 14:33'
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
			bottomFraction: 1)
]

{
	#category : #building,
	#'squeak_changestamp' : 'JZ 6/7/2024 14:32'
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
			bottomFraction: 0.4)
]

{
	#category : #building,
	#'squeak_changestamp' : 'JZ 6/7/2024 15:34'
}
IPTChapterView >> buildStartButtonWith: aBuilder [
	^ aBuilder pluggableButtonSpec new
		model: self;
		label: 'Start';
		action: #startSelectedLevel;
		padding: self padding;
		frame: (LayoutFrame new
			leftFraction: 0.3;
			topFraction: 0.4;
			rightFraction: 1;
			bottomFraction: 0.45)
]

{
	#category : #building,
	#'squeak_changestamp' : 'JZ 6/7/2024 15:33'
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
			};
		yourself)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 6/7/2024 13:49'
}
IPTChapterView >> chapterDescription [
	^ selectedChapter description.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 17:49'
}
IPTChapterView >> chapters [
	^ chapters
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 10:41'
}
IPTChapterView >> chapters: anObject [
	chapters := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 17:49'
}
IPTChapterView >> initialize [
	self chapters: IPTChapter chapterSet.
	self selectedChapter: (self chapters at: 1).
	self selectedLevel: (self levels at: 1).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 6/7/2024 13:25'
}
IPTChapterView >> ipt [
	^ ipt
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 6/7/2024 13:25'
}
IPTChapterView >> ipt: anObject [
	ipt := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 6/7/2024 13:49'
}
IPTChapterView >> levelDescription [
	^ selectedLevel description.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/7/2024 11:03'
}
IPTChapterView >> levels [
	^ self selectedChapter levels.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JZ 6/7/2024 14:29'
}
IPTChapterView >> padding [
	^ 5.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'JZ 6/7/2024 14:10'
}
IPTChapterView >> selectChapter: aChapter [	
	aChapter ifNotNil: [
		self selectedChapter: aChapter.
		Transcript show: aChapter.
		self changed: #selectedChapter.
		self changed: #levels.
		self changed: #chapterDescription.]
]

{
	#category : #actions,
	#'squeak_changestamp' : 'JZ 6/7/2024 14:10'
}
IPTChapterView >> selectLevel: aLevel [
	aLevel ifNotNil: [
		self selectedLevel: aLevel.
		Transcript show: aLevel.
		self changed: #selectedLevel.
		self changed: #levelDescription.]
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
	#'squeak_changestamp' : 'JZ 6/7/2024 14:10'
}
IPTChapterView >> selectedChapter: aChapter [
	selectedChapter := aChapter.
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
	#'squeak_changestamp' : 'JZ 6/7/2024 14:10'
}
IPTChapterView >> selectedLevel: aLevel [
	selectedLevel := aLevel.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 18:16'
}
IPTChapterView >> startSelectedLevel [
	ipt openLevel: self selectedLevel levelIndex 
		inChapter: self selectedChapter. 
	self changed: #close.
]