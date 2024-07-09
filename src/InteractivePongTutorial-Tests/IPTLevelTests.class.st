Class {
	#name : #IPTLevelTests,
	#superclass : #TestCase,
	#instVars : [
		'ipt'
	],
	#category : #'InteractivePongTutorial-Tests'
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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:22'
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
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:23'
}
IPTLevelTests >> testLevelDescriptions [
	
	IPTChapter chapterSet do: [ :chapter |
		chapter levels do: [ :lvl |
			self assert: lvl description isEmpty not.
			]].
]
