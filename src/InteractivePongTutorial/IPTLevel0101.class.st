Class {
	#name : #IPTLevel0101,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JZ 6/7/2024 14:15'
}
IPTLevel0101 >> description [
	^ 'This is level 01'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/15/2024 11:53'
}
IPTLevel0101 >> initialize [
	self 
		levelIndex: 1;
		name: 'Level01';
		visibleMethods: {
			IPTTestObject >> #aNormalMethod.
			IPTTestObject >> #aMethodWithParam:}.
	
]
