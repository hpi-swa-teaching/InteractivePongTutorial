Class {
	#name : #IPTEditor,
	#superclass : #CodeHolder,
	#instVars : [
		'activeCodePiece',
		'browser'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/6/2024 17:31'
}
IPTEditor class >> openOnBrowser: aBrowser [

	^ self new 	browser: aBrowser.
]

{
	#category : #style,
	#'squeak_changestamp' : 'Josua Zehner 7/6/2024 17:01'
}
IPTEditor >> aboutToStyle: aStyler [
	self codePiece ifNotNil: [
		self codePiece isClass ifTrue: [
			aStyler classOrMetaClass: nil.]
		ifFalse: [
		aStyler classOrMetaClass: self codePiece referencedClass]].
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
	#'squeak_changestamp' : 'Josua Zehner 7/6/2024 17:01'
}
IPTEditor >> codePiece: aCodePiece [
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
	#'squeak_changestamp' : 'Josua Zehner 7/6/2024 17:44'
}
IPTEditor >> setCodePiece: aCodePiece [
	
	self codePiece: aCodePiece.
	aCodePiece 
		ifNil: [
			self contents: '']
		ifNotNil: [
			aCodePiece isClass ifTrue: []
			ifFalse: [
			self setClass: aCodePiece referencedClass selector: aCodePiece referencedMethod.].
			self contents: aCodePiece code.].
	self changed: #contents.
	self changed: #readOnly.
	
	
		
		
		
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
