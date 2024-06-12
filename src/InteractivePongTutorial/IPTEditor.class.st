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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 19:20'
}
IPTEditor >> aboutToStyle: aStyler [

	self activeCodePiece ifNotNil: [
		aStyler classOrMetaClass: self activeCodePiece class].
	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 12:25'
}
IPTEditor >> accept [
	self changed: #acceptChanges
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 12:21'
}
IPTEditor >> actionOnSave [
	^ actionOnSave
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 12:21'
}
IPTEditor >> actionOnSave: anObject [
	actionOnSave := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 12:21'
}
IPTEditor >> activeCodePiece [
	^ activeCodePiece
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 19:23'
}
IPTEditor >> activeCodePiece: aCodePiece [
	activeCodePiece := aCodePiece.
	
	self code: (aCodePiece codeToEditForLevel: self browser levelIndex ).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 19:07'
}
IPTEditor >> browser [
	^ browser
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 19:07'
}
IPTEditor >> browser: anObject [
	browser := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 12:22'
}
IPTEditor >> buildCodePaneWith: builder [

	^ (super buildCodePaneWith: builder)
		stylerClass: MotuTextStyler;
		setText: #evaluateAndSaveText:notifying:;
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 12:25'
}
IPTEditor >> code [
	^ self contents
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 12:25'
}
IPTEditor >> code: aString [

	self contents: aString.
	self changed: #contents
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 12:22'
}
IPTEditor >> evaluateAndSaveText: aText notifying: aController [
	
	self code: aText.
	self actionOnSave value
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 12:22'
}
IPTEditor >> evaluateExpression: aString [

	UIManager default inform: 'Please use the "Evaluate code" button to test your code'.
	^ nil
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 19:22'
}
IPTEditor >> parameters [
	 ^ {}.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 12:23'
}
IPTEditor >> showSolutionCode [
	
	self code: self activeCodePiece solutionCode.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 12:23'
}
IPTEditor >> wantsAnnotationPane [
	^ false
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 12:23'
}
IPTEditor >> wantsOptionalButtons [
	^ false
]
