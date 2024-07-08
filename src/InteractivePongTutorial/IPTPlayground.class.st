Class {
	#name : #IPTPlayground,
	#superclass : #PasteUpMorph,
	#instVars : [
		'isRunning'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/8/2024 15:28'
}
IPTPlayground >> clear [
	
	self 
		isRunning: false;
		removeAllMorphs.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/8/2024 15:31'
}
IPTPlayground >> initialize [
	| theme |

	super initialize.
	self 
		layoutFrame: (LayoutFrame fractions: (0@0 rect: 1@1));
		isRunning: false;
		beSticky.
	
	theme := Smalltalk at: #SqueakTheme ifAbsent: nil.
	theme
		ifNil: [self color: Preferences defaultWorldColor] 
		ifNotNil: [self setAsBackground: theme linenblue].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/8/2024 15:27'
}
IPTPlayground >> isRunning [
	^ isRunning
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/8/2024 15:27'
}
IPTPlayground >> isRunning: anObject [
	isRunning := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/8/2024 15:28'
}
IPTPlayground >> runCode [
	
	self clear;
		isRunning: true;
		addMorph: (IPTGame new
			setupWithExtent: self extent position: self position;
			yourself).
]
