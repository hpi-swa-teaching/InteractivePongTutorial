Class {
	#name : #IPTLevelTests,
	#superclass : #TestCase,
	#instVars : [
		'ipt'
	],
	#category : #'InteractivePongTutorial-Tests'
}

{
	#category : #running,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/9/2024 16:22'
}
IPTLevelTests >> setUp [

	ipt := IPT new.

]

{
	#category : #running,
	#'squeak_changestamp' : 'sv 7/3/2024 10:08'
}
IPTLevelTests >> tearDown [

	ipt closeAllWindows.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'sv 7/12/2024 18:53'
}
IPTLevelTests >> testInitialState [
	
	IPTChapter chapterSet do: [ :chapter |
		chapter levels do: [ :level |
			
			ipt openLevel: (chapter levels indexOf: level) inChapter: chapter.
			ipt browser runCode.
			
			self assert: ((ipt browser testResult at: #failures) isEmpty and: (ipt browser testResult at: #errors) isEmpty) not.
			ipt closeAllWindows. ]]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'sv 7/12/2024 18:53'
}
IPTLevelTests >> testLevelDescriptions [
	
	IPTChapter chapterSet do: [ :chapter |
		chapter levels do: [ :lvl |
			self assert: lvl description isEmpty not. ]].
]

{
	#category : #testing,
	#'squeak_changestamp' : 'sv 7/12/2024 18:55'
}
IPTLevelTests >> testSolutionCode [
	
	IPTChapter chapterSet do: [ :chapter |
		chapter levels do: [ :level |
			
			ipt openLevel: (chapter levels indexOf: level) inChapter: chapter.
	
			ipt browser visibleClassSet do: [ :iptClass |
				iptClass methodCodePieces do: [ :codePiece |
					ipt browser 
						selectCodePiece: codePiece;
						loadSolutionButtonAction. ]].
			ipt browser runCode.
	
			self assert: (ipt browser testResult at: #errors) isEmpty.
			self assert: (ipt browser testResult at: #failures) isEmpty.
			ipt closeAllWindows. ]]
]
