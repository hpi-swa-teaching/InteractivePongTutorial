Class {
	#name : #IPTChapterViewTests,
	#superclass : #TestCase,
	#instVars : [
		'chapterview'
	],
	#category : #'InteractivePongTutorial-Core-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 11:29'
}
IPTChapterViewTests >> setUp [
	chapterview := IPTChapterView new ipt: IPT new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 11:30'
}
IPTChapterViewTests >> tearDown [
	chapterview := nil.
]
