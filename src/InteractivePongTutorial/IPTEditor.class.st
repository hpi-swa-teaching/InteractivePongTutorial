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
	#'squeak_changestamp' : 'Felix Knöfel 6/11/2024 19:20'
}
IPTEditor >> aboutToStyle: aStyler [

	self activeCodePiece ifNotNil: [
		aStyler classOrMetaClass: self activeCodePiece class].
	^ true
]

{
	#category : #building,
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
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 14:55'
}
IPTEditor >> activeCodePiece: aCodePiece [
	activeCodePiece := aCodePiece.
	
	Transcript show: 'Changing codePiece with text: ', aCodePiece code, Character cr.
	aCodePiece 
		ifNil: [self code: '']
		ifNotNil: [self code: aCodePiece code].
		
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
	#category : #building,
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 11:47'
}
IPTEditor >> buildCodePaneWith: builder [

	^ (super buildCodePaneWith: builder)
		setText: #evaluateAndSaveText:notifying:;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 12:25'
}
IPTEditor >> code [
	^ self contents
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 14:54'
}
IPTEditor >> code: aString [

	self contents: aString;
		update.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 12:15'
}
IPTEditor >> evaluateAndSaveText: aText notifying: aController [
	
	Transcript show: 'The text is evaluated'.
	self code: aText.
	self actionOnSave value.
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 11:49'
}
IPTEditor >> evaluateExpression: aString [

	UIManager default inform: 'Please use the "Verify" button to test your code'.
	^ nil
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
	#'squeak_changestamp' : 'Felix Knöfel 6/12/2024 11:48'
}
IPTEditor >> wantsAnnotationPane [
	^ false
]

{
	#category : #style,
	#'squeak_changestamp' : 'Felix Knöfel 6/5/2024 12:23'
}
IPTEditor >> wantsOptionalButtons [
	^ false
]
