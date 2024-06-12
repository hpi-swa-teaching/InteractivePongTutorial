Class {
	#name : #IPTTests,
	#superclass : #TestCase,
	#instVars : [
		'ipt'
	],
	#category : #'InteractivePongTutorial-Core-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 11:26'
}
IPTTests >> setUp [
	ipt := IPT new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/12/2024 11:26'
}
IPTTests >> tearDown [
	ipt := nil.
]
