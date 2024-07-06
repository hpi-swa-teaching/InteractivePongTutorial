Class {
	#name : #IPTLevelTests,
	#superclass : #TestCase,
	#instVars : [
		'ipt'
	],
	#category : #'InteractivePongTutorial-Core-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/6/2024 17:29'
}
IPTLevelTests >> int_tstLevel: levelIndex inChapter: chapter [

	ipt openLevel: levelIndex inChapter: chapter.
	
	ipt browser visibleClassSet do: [ :el |
		el methodCodePieces do: [ :cp |
			ipt browser selectCodePiece: cp;
			loadSolutionButtonAction.]].
	
	ipt browser runCode.
	
	self assert: ((ipt browser testResult at: #errors) isEmpty).
	self assert: ((ipt browser testResult at: #failures) isEmpty).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 7/3/2024 10:08'
}
IPTLevelTests >> setUp [
	ipt := IPT new.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 7/3/2024 10:08'
}
IPTLevelTests >> tearDown [

	ipt closeAllWindows.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 7/3/2024 11:06'
}
IPTLevelTests >> testLevelDescriptions [
	
	IPTChapter chapterSet do: [ :chapter |
		chapter levels do: [ :lvl |
			self assert: lvl description isEmpty not.
			self tearDown.
			self setUp.
			]].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 7/3/2024 10:28'
}
IPTLevelTests >> testLevelSolution [
	
	IPTChapter chapterSet do: [ :chapter |
		chapter levels do: [ :lvl |
			self int_tstLevel: lvl levelIndex inChapter: chapter.
			self tearDown.
			self setUp.
			]].
]
