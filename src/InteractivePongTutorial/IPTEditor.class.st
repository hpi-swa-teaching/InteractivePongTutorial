Class {
	#name : #IPTEditor,
	#superclass : #CodeHolder,
	#instVars : [
		'activeCodePiece',
		'actionOnSave',
		'browser'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 19:09'
}
IPTEditor class >> openOnBrowser: aBrowser [
	^ self new 
		browser: aBrowser;
		yourself.
]

{
	#category : #style,
	#'squeak_changestamp' : 'Josua Zehner 7/5/2024 15:42'
}
IPTEditor >> aboutToStyle: aStyler [
	self activeCodePiece ifNotNil: [
		self activeCodePiece isClass ifTrue: [
			aStyler classOrMetaClass: nil.]
		ifFalse: [
		aStyler classOrMetaClass: self activeCodePiece referencedClass]].
	^ true.
]

{
	#category : #building,
	#'squeak_changestamp' : 'FH 6/19/2024 14:35'
}
IPTEditor >> accept [
	self changed: #acceptChanges.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 6/19/2024 14:36'
}
IPTEditor >> actionOnSave [
	^ actionOnSave.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 6/19/2024 14:37'
}
IPTEditor >> actionOnSave: anAction [
	actionOnSave := anAction.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 6/19/2024 14:37'
}
IPTEditor >> activeCodePiece [
	^ activeCodePiece.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/5/2024 15:31'
}
IPTEditor >> activeCodePiece: aCodePiece [
	activeCodePiece := aCodePiece.
	
	aCodePiece 
		ifNil: [
			self contents: '']
		ifNotNil: [
			aCodePiece isClass ifTrue: []
			ifFalse: [
			self setClass: aCodePiece referencedClass selector: aCodePiece referencedMethod.].
			self contents: aCodePiece code.].
	self changed: #contents.
		
		
		
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 6/19/2024 14:37'
}
IPTEditor >> browser [
	^ browser.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 6/19/2024 14:38'
}
IPTEditor >> browser: anObject [
	browser := anObject.
]

{
	#category : #evaluating,
	#'squeak_changestamp' : 'Josua Zehner 7/4/2024 09:23'
}
IPTEditor >> checkSyntax [
	
	self activeCodePiece readOnly ifTrue: [^ 'You cannot change this code!'].	

	(((self contents splitBy: {Character cr}) at: 1) withBlanksTrimmed = self activeCodePiece head)
		ifFalse: [^ 'You must leave the head line unchanged!'].
	^ ''.

]

{
	#category : #evaluating,
	#'squeak_changestamp' : 'Josua Zehner 7/4/2024 19:09'
}
IPTEditor >> contents: input notifying: aController [

	| errorMessage |
	
	self browser closeAllAutoCompletionMorphs.
	errorMessage := self checkSyntax.
	errorMessage ifNotEmpty: [ UIManager default inform: errorMessage].
	self activeCodePiece code: self contents.
	self activeCodePiece referencedClass compile: input.
	super contents: input notifying: aController.
	self changed: #contents.
]

{
	#category : #evaluating,
	#'squeak_changestamp' : 'Josua Zehner 7/3/2024 19:05'
}
IPTEditor >> evaluateAndSaveText: aText notifying: aController [
	self contents: aText.
	self actionOnSave value.
	self update.
	
	
]

{
	#category : #evaluating,
	#'squeak_changestamp' : 'FH 6/19/2024 14:39'
}
IPTEditor >> evaluateExpression: aString [
	UIManager default inform: 'Please use the "Verify" button to test your code'.
	^ nil.
]

{
	#category : #style,
	#'squeak_changestamp' : 'FH 6/19/2024 14:39'
}
IPTEditor >> wantsAnnotationPane [
	^ false.
]

{
	#category : #style,
	#'squeak_changestamp' : 'Josua Zehner 7/4/2024 19:03'
}
IPTEditor >> wantsOptionalButtons [
	^ false.
]
