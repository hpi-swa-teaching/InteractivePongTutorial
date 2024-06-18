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
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 19:59'
}
IPTChapterView class >> openFrom: anIPT [
	
	|chapterView|
	chapterView := self new ipt: anIPT.
	ToolBuilder open: chapterView.
	^ chapterView.
]

{
	#category : #building,
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 12:45'
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
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 12:45'
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
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 12:44'
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
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 14:43'
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
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 12:45'
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
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 14:43'
}
IPTChapterView >> canStartLevel [
	^ selectedLevel isNil not.
]

{
	#category : #ui,
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
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 12:47'
}
IPTChapterView >> chapters: aChapter [
	chapters := aChapter.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Josua Zehner 6/17/2024 19:53'
}
IPTChapterView >> close [
	self changed: #close.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Felix Knöfel 6/15/2024 13:24'
}
IPTChapterView >> initialize [
	self chapters: IPTChapter chapterSet.
	self selectedChapter: (self chapters at: 1).
	self levels ifNotEmpty: [self selectedLevel: (self levels at: 1)] ifEmpty: [self selectedLevel: nil].
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 12:47'
}
IPTChapterView >> ipt [
	^ ipt.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 12:47'
}
IPTChapterView >> ipt: anIPT [
	ipt := anIPT.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Felix Knöfel 6/15/2024 13:22'
}
IPTChapterView >> levelDescription [
	^ self selectedLevel ifNotNil: [self selectedLevel description] ifNil: [self noLevelSelectedMessage].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 11:52'
}
IPTChapterView >> levels [
	^ self selectedChapter levels ifNotNil: [self selectedChapter levels] ifNil: [{}].
]

{
	#category : #ui,
	#'squeak_changestamp' : 'sv 6/15/2024 10:30'
}
IPTChapterView >> noLevelSelectedMessage [
	^ 'Please select a level.'.
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
	#'squeak_changestamp' : 'Felix Knöfel 6/15/2024 13:28'
}
IPTChapterView >> selectChapter: aChapter [	
	aChapter ifNotNil: [
		self selectedChapter: aChapter.
		self selectLevel: (aChapter levels ifNotEmpty: [aChapter levels at: 1] ifEmpty: [ nil ]).
		self update.
		].
	
]

{
	#category : #actions,
	#'squeak_changestamp' : 'FH 6/15/2024 11:30'
}
IPTChapterView >> selectLevel: aLevel [
	self selectedLevel: aLevel.
	self update.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 12:48'
}
IPTChapterView >> selectedChapter [
	^ selectedChapter.
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
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 12:48'
}
IPTChapterView >> selectedLevel [
	^ selectedLevel.
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
	#'squeak_changestamp' : 'Josua Zehner 6/18/2024 09:06'
}
IPTChapterView >> startSelectedLevel [
	ipt openLevel: self selectedLevel levelIndex 
		inChapter: self selectedChapter. 
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 14:43'
}
IPTChapterView >> update [
	self changed: #selectedChapter.
	self changed: #levels.
	self changed: #selectedLevel.
	self changed: #levelDescription.
	self changed: #chapterDescription.
	self changed: #canStartLevel.
]
