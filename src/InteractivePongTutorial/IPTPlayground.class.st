Class {
	#name : #IPTPlayground,
	#superclass : #PasteUpMorph,
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/18/2024 17:27'
}
IPTPlayground >> initialize [
	| theme |

	super initialize.


	self layoutFrame: (LayoutFrame fractions: (0@0 rect: 1@1)).
	
	self beSticky.
	
	theme := Smalltalk at: #SqueakTheme ifAbsent: nil.
	theme
		ifNil: [self color: Preferences defaultWorldColor  ] 
		ifNotNil: [ self setAsBackground: theme linenblue ].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 11:09'
}
IPTPlayground >> runCode [
	| game |
	self removeAllMorphs.
	game := IPTGameSolution new.
	self addMorph: game. 
	game setupWithExtent: self extent position: self position.
]
