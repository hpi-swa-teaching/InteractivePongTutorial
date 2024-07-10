"
This class displays and runs the game code. It is opened in the Browser.
"
Class {
	#name : #IPTPlayground,
	#superclass : #PasteUpMorph,
	#instVars : [
		'isRunning'
	],
	#category : #'InteractivePongTutorial-Core',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 11:14'
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
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 12:28'
}
IPTPlayground >> initialize [
	
	super initialize.
	self 
		layoutFrame: (LayoutFrame fractions: (0@0 rect: 1@1));
		isRunning: false;
		beSticky.
	
	(Smalltalk at: #SqueakTheme ifAbsent: nil)
		ifNotNil: [:theme | self setAsBackground: theme linenblue]
		ifNil: [self color: Preferences defaultWorldColor] .
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
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 12:29'
}
IPTPlayground >> runCode [
	
	self 
		clear;
		isRunning: true;
		addMorph: (IPTGame new
			setupWithExtent: self extent position: self position;
			yourself).
]
