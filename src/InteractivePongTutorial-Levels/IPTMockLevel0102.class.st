Class {
	#name : #IPTMockLevel0102,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels'
}

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:10'
}
IPTMockLevel0102 class >> asString [
	
	^ 'Mocklevel 02'.
]

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:11'
}
IPTMockLevel0102 class >> description [
	
	^ 'Mocklevel 02 description'.
]

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:08'
}
IPTMockLevel0102 class >> explanations [
	
	^ {'explanation 1'. 'explanation 2'}.
]

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:11'
}
IPTMockLevel0102 class >> levelIndex [

	^ 2.
]

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 15:05'
}
IPTMockLevel0102 class >> visibleMethods [

	^ {IPTMockGame>>#mockMethod}.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'sv 7/12/2024 18:56'
}
IPTMockLevel0102 >> testMockMethod [
	
	self methodToBeTested: (IPTMockGame >> #mockMethod).
	
	self assert: IPTMockGame new mockMethod = true description: 'mockMethod not changed'.
]
