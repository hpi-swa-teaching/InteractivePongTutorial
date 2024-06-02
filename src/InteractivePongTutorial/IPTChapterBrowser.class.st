Class {
	#name : #IPTChapterBrowser,
	#superclass : #Model,
	#instVars : [
		'selectedChapter',
		'selectedLevel'
	],
	#category : #InteractivePongTutorial
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 13:22'
}
IPTChapterBrowser class >> open [
	^self new open
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 14:07'
}
IPTChapterBrowser >> ChapterList [
	^ {'Introduction'}
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 13:56'
}
IPTChapterBrowser >> buildLevelListWith: aBuilder [

	^ aBuilder pluggableTreeSpec new
		model: self;
		roots: #ChapterList;
		nodeClass: IPTChapterWrapper;
		"getSelected: #selectedLevel;
		setSelected: #selectedLevel:;"
		autoDeselect: true;
		frame: (LayoutFrame new
			leftFraction: 0;
			topFraction: 0;
			rightFraction: 1;
			bottomFraction: 1)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 13:31'
}
IPTChapterBrowser >> buildWith: aBuilder [
	^ aBuilder build: (aBuilder pluggableWindowSpec new
		model: self;
		label: 'Interactive Pong Tutorial';"#labelString;"
		extent: (1200@800);"self class defaultExtent;"
		children: {
			self buildLevelListWith: aBuilder
			"self buildLevelListWith: aBuilder"
			};
		yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 13:23'
}
IPTChapterBrowser >> open [
	^ToolBuilder open: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 13:25'
}
IPTChapterBrowser >> selectedChapter [
	^ selectedChapter
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 13:25'
}
IPTChapterBrowser >> selectedChapter: anObject [
	selectedChapter := anObject
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
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 13:25'
}
IPTChapterBrowser >> selectedLevel: anObject [
	selectedLevel := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/2/2024 13:25'
}
IPTChapterBrowser >> windowColorToUse [ 
	^ Color white darker.
]
