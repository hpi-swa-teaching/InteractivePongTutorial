Class {
	#name : #IPT,
	#superclass : #Object,
	#category : #InteractivePongTutorial
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JZ 6/7/2024 13:15'
}
IPT class >> open [
	^ self new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JZ 6/7/2024 13:23'
}
IPT >> initialize [
	TheWorldMenu registerOpenCommand: {'Interactive Pong Tutorial'. {self class. #open}}.
	self openChapterView.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JZ 6/7/2024 13:28'
}
IPT >> openBrowser [
	IPTBrowser openFrom: self.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JZ 6/7/2024 13:28'
}
IPT >> openChapterView [
	IPTChapterView openFrom: self.
]
