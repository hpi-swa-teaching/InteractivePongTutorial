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
	#'squeak_changestamp' : 'FH 6/19/2024 14:35'
}
IPTEditor >> aboutToStyle: aStyler [
	self activeCodePiece ifNotNil: [
		aStyler classOrMetaClass: self activeCodePiece class].
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
	#'squeak_changestamp' : 'Felix Knöfel 6/23/2024 23:38'
}
IPTEditor >> activeCodePiece: aCodePiece [
	activeCodePiece := aCodePiece.
	
	aCodePiece 
		ifNil: [
			self code: '']
		ifNotNil: [
			self code: aCodePiece code.].
		
		
		
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
	#category : #building,
	#'squeak_changestamp' : 'FH 6/19/2024 14:38'
}
IPTEditor >> buildCodePaneWith: abuilder [
	^ (super buildCodePaneWith: abuilder)
		setText: #evaluateAndSaveText:notifying:;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 6/19/2024 14:38'
}
IPTEditor >> code [
	^ self contents.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FH 6/19/2024 14:38'
}
IPTEditor >> code: aString [
	self contents: aString;
		update.
]

{
	#category : #evaluating,
	#'squeak_changestamp' : 'FH 6/19/2024 14:39'
}
IPTEditor >> evaluateAndSaveText: aText notifying: aController [
	self code: aText.
	self actionOnSave value.
	
	
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
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 14:52'
}
IPTEditor >> update [
	self changed: #contents.
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
	#'squeak_changestamp' : 'FH 6/19/2024 14:39'
}
IPTEditor >> wantsOptionalButtons [
	^ false.
]
