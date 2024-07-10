"
This class shows the code of the selected Method and allows you to change it. It is opened in the Browser
"
Class {
	#name : #IPTEditor,
	#superclass : #CodeHolder,
	#instVars : [
		'activeCodePiece',
		'browser'
	],
	#category : #'InteractivePongTutorial-Core',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 11:11'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 12:27'
}
IPTEditor class >> openOnBrowser: aBrowser [

	^ self new browser: aBrowser.
]

{
	#category : #style,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 12:23'
}
IPTEditor >> aboutToStyle: aStyler [

	self codePiece ifNotNil: [
		aStyler classOrMetaClass: (self codePiece isClass 
			ifTrue: [nil]
			ifFalse: [self codePiece referencedClass])].
	^ true.
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
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 7/6/2024 17:01'
}
IPTEditor >> codePiece [
	^ activeCodePiece.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 12:23'
}
IPTEditor >> codePiece: aCodePiece [
	activeCodePiece := aCodePiece.
		
		
		
]

{
	#category : #evaluating,
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 11:31'
}
IPTEditor >> contents: input notifying: aController [

	| errorMessage |
	errorMessage := self codePiece checkSyntax: input.
	errorMessage 
		ifNotEmpty: [
			UIManager default inform: errorMessage.
			self codePiece readOnly ifTrue: [
				self contents: self codePiece code.]]
		ifEmpty: [
			super contents: input notifying: aController.
			self codePiece code: input.
			self codePiece compileCode.
			self browser clearPlayground.].
		
	self changed: #contents.
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
	#category : #accessing,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 12:25'
}
IPTEditor >> setCodePiece: aCodePiece [
	
	self codePiece: aCodePiece.
	self contents: ''.
	aCodePiece ifNotNil: [
		self contents: aCodePiece code.
		aCodePiece isClass ifFalse: [
			self setClass: aCodePiece referencedClass selector: aCodePiece referencedMethod]].
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
	#'squeak_changestamp' : 'Josua Zehner 7/4/2024 19:03'
}
IPTEditor >> wantsOptionalButtons [
	^ false.
]
